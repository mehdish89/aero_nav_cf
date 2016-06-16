#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <std_srvs/Empty.h>
#include <geometry_msgs/Twist.h>
#include <cmath> 


#include "pid.hpp"

double get(
    const ros::NodeHandle& n,
    const std::string& name) {
    double value;
    n.getParam(name, value);
    return value;
}

class Controller
{
public:

    Controller(
        const std::string& frame,
        const ros::NodeHandle& n)
        : m_frame(frame)
        , m_pubNav()
        , pub_targetDrone()
        , m_listener()
        , m_pidX(
            "PIDs/X/kp",
            "PIDs/X/kd",
            "PIDs/X/ki",
            "PIDs/X/minOutput",
            "PIDs/X/maxOutput",
            "PIDs/X/integratorMin",
            "PIDs/X/integratorMax",
            "X", 
            n)

        , m_pidY(
            "PIDs/Y/kp",
            "PIDs/Y/kd",
            "PIDs/Y/ki",
            "PIDs/Y/minOutput",
            "PIDs/Y/maxOutput",
            "PIDs/Y/integratorMin",
            "PIDs/Y/integratorMax",
            "Y", 
            n)
        , m_pidZ(
            "PIDs/Z/kp",
            "PIDs/Z/kd",
            "PIDs/Z/ki",
            "PIDs/Z/minOutput",
            "PIDs/Z/maxOutput",
            "PIDs/Z/integratorMin",
            "PIDs/Z/integratorMax",
            "Z", 
            n)

        , m_pidXp(
            "PIDs/Xp/kp",
            "PIDs/Xp/kd",
            "PIDs/Xp/ki",
            "PIDs/Xp/minOutput",
            "PIDs/Xp/maxOutput",
            "PIDs/Xp/integratorMin",
            "PIDs/Xp/integratorMax",
            "Xp", 
            n)

        , m_pidYp(
            "PIDs/Yp/kp",
            "PIDs/Yp/kd",
            "PIDs/Yp/ki",
            "PIDs/Yp/minOutput",
            "PIDs/Yp/maxOutput",
            "PIDs/Yp/integratorMin",
            "PIDs/Yp/integratorMax",
            "Yp", 
            n)

        , m_pidYaw(
            "PIDs/Yaw/kp",
            "PIDs/Yaw/kd",
            "PIDs/Yaw/ki",
            "PIDs/Yaw/minOutput",
            "PIDs/Yaw/maxOutput",
            "PIDs/Yaw/integratorMin",
            "PIDs/Yaw/integratorMax",
            "Yaw", 
            n)
        , m_state(Idle)
        , m_goal()
        , m_vel()
        , m_subscribeGoal()
        , m_serviceTakeoff()
        , m_serviceLand()
        , m_thrust(0)
    {
        ros::NodeHandle nh;
        m_pubNav = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
        pub_cmd = nh.advertise<geometry_msgs::PoseStamped>("cmd_time", 1);
        pub_vel = nh.advertise<geometry_msgs::PoseStamped>("velocity", 1);
        pub_targetDrone = nh.advertise<geometry_msgs::PoseStamped>("diff_pose", 1);
        m_PosePid = nh.subscribe("/crazyflie/pid",1,&Controller::posePid,this);
        m_subscribeGoal = nh.subscribe("goal", 1, &Controller::goalChanged, this);
        m_subVel = nh.subscribe("/geometry_msgs/Twist", 1, &Controller::velChanged, this);
        m_serviceTakeoff = nh.advertiseService("takeoff", &Controller::takeoff, this);
        m_serviceLand = nh.advertiseService("land", &Controller::land, this);
    }	

    void run(double frequency)
    {
        ros::NodeHandle node;
        ros::Timer timer = node.createTimer(ros::Duration(1.0/frequency), &Controller::iteration, this);
        ros::spin();
    }

private:
    void goalChanged(
        const geometry_msgs::PoseStamped::ConstPtr& msg)
    {
        m_goal = *msg;
        //ROS_INFO("goal");
        //ROS_INFO_STREAM(m_goal);
    }

    void velChanged(
        const geometry_msgs::Twist::ConstPtr& msg)
    {
        m_vel = *msg;
        //ROS_INFO("goal");
        //ROS_INFO_STREAM(m_goal);
    }

    void posePid(const geometry_msgs::PoseStamped::ConstPtr& msg)
    {
    	m_po = *msg;

    }

    bool takeoff(
        std_srvs::Empty::Request& req,
        std_srvs::Empty::Response& res)
    {
        ROS_INFO("Takeoff requested!");
        m_state = TakingOff;

        return true;
    }

    bool land(
        std_srvs::Empty::Request& req,
        std_srvs::Empty::Response& res)
    {
        ROS_INFO("Landing requested!");
        m_state = Landing;

        return true;
    }

    void getTransform(
        const std::string& sourceFrame,
        const std::string& targetFrame,
        tf::StampedTransform& result)
    {
        m_listener.lookupTransform(sourceFrame, targetFrame, ros::Time(0), result);
    }

    void pidReset()
    {
        m_pidX.reset();
        m_pidY.reset();
        m_pidZ.reset();
        m_pidYaw.reset();
    }

    void iteration(const ros::TimerEvent& e)
    {
        float dt = e.current_real.toSec() - e.last_real.toSec();
        //ROS_INFO_STREAM(m_state);
        //m_serviceTakeoff

        switch(m_state)
        {
        case TakingOff:
            {
            	ROS_INFO("=======================================this is takingoff===============================");
                tf::StampedTransform transform;
                m_listener.lookupTransform("/world", m_frame, ros::Time(0), transform);
                // m_listener.lookupTransform("/tag_1", m_frame, ros::Time(0), transform);
                if (transform.getOrigin().z() > 0.05 || m_thrust > 40000 || true)
                {
                    pidReset();
                    m_pidZ.setIntegral(m_thrust / m_pidZ.ki());
                    m_state = Automatic;
                    m_thrust = 0;
                }
                else
                {
                    m_thrust += 10000 * dt;
                    geometry_msgs::Twist msg;
                    msg.linear.z = m_thrust;
                    m_pubNav.publish(msg);
                    //ROS_INFO_STREAM(m_thrust);
                }
                

            }
            break;
        case Landing:
            {
                m_goal.pose.position.z = 0.05;
                tf::StampedTransform transform;
                m_listener.lookupTransform("/world", m_frame, ros::Time(0), transform);
                // m_listener.lookupTransform("/tag_1", m_frame, ros::Time(0), transform);
                if (transform.getOrigin().z() <= 0.05 || true) {
                    m_state = Idle;
                    geometry_msgs::Twist msg;
                    m_pubNav.publish(msg);
                }
                ROS_INFO("=======================================this is landing===============================");
            }
            // intentional fall-thru
        case Automatic:
            {
            	ROS_INFO("=======================================this is automatic===============================");
                tf::StampedTransform transform;
                m_listener.lookupTransform("/world", m_frame, ros::Time(0), transform);
                // m_listener.lookupTransform("/tag_1", m_frame, ros::Time(0), transform);

                //tf::Stamped< tf::Pose > targetWorld(m_goal, transform.stamp_, "world");

                geometry_msgs::PoseStamped targetWorld;
                //(m_goal, transform.stamp_, "world");

                // targetWorld.header.stamp = transform.stamp_;
                // targetWorld.header.stamp  = m_po.header.stamp;
                targetWorld.header.frame_id = "world";
                // targetWorld.header.frame_id = "/tag_1";

                targetWorld.pose = m_goal.pose;
                targetWorld.pose.orientation.w = 1.;

                //tf::Stamped< tf::Pose > targetDrone;
                geometry_msgs::PoseStamped targetDrone;


                m_listener.transformPose(m_frame, targetWorld, targetDrone);
                //m_listener.transformPose("/tag_1", targetWorld, targetDrone);
                // pub_targetDrone.publish(targetDrone);
                
               // ROS_INFO_STREAM(targetDrone);
               // ROS_INFO_STREAM(m_frame);
               

                tfScalar roll, pitch, yaw;
                tf::Matrix3x3(
                    tf::Quaternion(
                        targetDrone.pose.orientation.x,
                        targetDrone.pose.orientation.y,
                        targetDrone.pose.orientation.z,
                        targetDrone.pose.orientation.w
                    )).getRPY(roll, pitch, yaw);

                // ROS_INFO_STREAM(yaw);

                geometry_msgs::Twist msg1;

                tfScalar roll1, pitch1, yaw1;
                tf::Matrix3x3(
                    tf::Quaternion(
                        m_po.pose.orientation.x,
                    	m_po.pose.orientation.y,
                        m_po.pose.orientation.z,
                        m_po.pose.orientation.w
                    )).getRPY(roll1, pitch1, yaw1);

                // float e_roll, e_pitch;
                // e_roll = roll;
                // e_pitch = pitch;
                // ROS_INFO_STREAM(180*roll1/3.14);

                double x = m_po.pose.position.x;
                double y = m_po.pose.position.y;
                double z = m_po.pose.position.z;

                //m_listener.lookupTransform(m_frame, "goal", ros::Time(0), transform);

                

                double x_goal = targetDrone.pose.position.x; //transform.getOrigin().getX();//0.16;
                double y_goal = targetDrone.pose.position.y; //transform.getOrigin().getY();

                ROS_INFO("x_goal");
                ROS_INFO_STREAM(x_goal);

                ROS_INFO("y_goal");
                ROS_INFO_STREAM(y_goal);

                double z_goal = 0.30;
                /*ROS_INFO("x");
                ROS_INFO_STREAM(x);
                ROS_INFO("y");
                ROS_INFO_STREAM(y);
				*/

                double x_sign = (x_goal>0)*2-1;
                double y_sign = (y_goal>0)*2-1;


                // ROS_INFO("x_sign");
                // ROS_INFO_STREAM(log(x_sign * x_goal));

                // ROS_INFO("y_sign");
                // ROS_INFO_STREAM(log(y_sign * y_goal));

                double vx = m_vel.linear.x;
                double vy = m_vel.linear.y;

                // msg1.linear.x  =  -m_pidX.update(0, 180*pitch1/3.14) - m_pidXp.update(0, x_sign * log(x_sign * x_goal * 100 + 1)) * 10;
                // msg1.linear.y  =  -m_pidY.update(0, 180*roll1/3.14) + m_pidYp.update(0, y_sign * log(y_sign * y_goal * 100 + 1)) * 10;

                msg1.linear.x  =  -m_pidX.update(0, 180*pitch1/3.14)/2 + m_pidXp.update(0, x_sign * (x_sign * x_goal )) * 900;
                msg1.linear.y  =  -m_pidY.update(0, 180*roll1/3.14)/2 - m_pidYp.update(0, y_sign * (y_sign * y_goal)) * 900;

                /*

                if(z>0.0 || true){
                    msg1.linear.x  =  -m_pidX.update(0, 180*pitch1/3.14) + m_pidXp.update(0, vx) * 150;
                    msg1.linear.y  =  -m_pidY.update(0, 180*roll1/3.14) - m_pidYp.update(0, vy) * 150;
                } else{
                    msg1.linear.x  =  -m_pidX.update(0, 180*pitch1/3.14);
                    msg1.linear.y  =  -m_pidY.update(0, 180*roll1/3.14);
                }
                */

                msg1.linear.z  = 39000;// + m_pidZ.update(-z_goal, -z);//40500; // 0;//35000; //41000;//38000;//

                msg1.angular.z = 0;//m_pidYaw.update(-2.20, 180*yaw1/3.14); 

                m_pubNav.publish(msg1);

                

                // geometry_msgs::PoseStamped command;
                // command.header.stamp = m_po.header.stamp;//ros::Time::now();//ros::Time(0);
                // command.pose.orientation.x = msg1.linear.x;
                // command.pose.orientation.y = msg1.linear.y;
                // command.pose.orientation.z = msg1.linear.z;
                // command.pose.orientation.w = msg1.angular.z;


                // pub_cmd.publish(command);

                // geometry_msgs::PoseStamped velocity;
                // velocity.header.stamp = m_po.header.stamp;
                // velocity.pose.position.x = vx;
                // velocity.pose.position.y = vy;
                // velocity.pose.position.z = m_vel.linear.z;
                // velocity.pose.orientation.x = m_vel.angular.x;
                // velocity.pose.orientation.y = m_vel.angular.y;
                // velocity.pose.orientation.z = m_vel.angular.z;

                // pub_vel.publish(velocity);

                


                //ROS_INFO_STREAM(roll1, pitch1+ "---" + yaw1+ "---" );
                
                //ROS_INFO("roll1");
                //ROS_INFO_STREAM(roll1);

                //ROS_INFO("pitch1");
                //ROS_INFO_STREAM(pitch1);

                //ROS_INFO("yaw1");
                //ROS_INFO_STREAM(yaw1);
                

                // geometry_msgs::PoseStamped targetDrone;
                // m_listener.transformPose(m_frame, targetWorld, targetDrone);
                //m_listener.transformPose("/tag_1", targetWorld, targetDrone);
                
               // ROS_INFO_STREAM(targetDrone);
               // ROS_INFO_STREAM(m_frame);
                




                // geometry_msgs::Twist msg;
                // msg.linear.x = m_pidX.update(0, targetDrone.pose.position.x);
                // msg.linear.y = m_pidY.update(0.0, targetDrone.pose.position.y);
                // msg.linear.z = m_pidZ.update(0.0, targetDrone.pose.position.z);
                // // msg.angular.z = m_pidYaw.update(0.0, yaw);
                // msg.angular.z = m_pidYaw.update(yaw, yaw);
                // m_pubNav.publish(msg);
                // ROS_INFO_STREAM(msg);


            }
            break;
        case Idle:
            {
                geometry_msgs::Twist msg;
                //msg.linear.x

                m_pubNav.publish(msg);
                //ROS_INFO("=======================================this is idle===============================");
            }
            break;
        }
    }

private:

    enum State
    {
        Idle = 0,
        Automatic = 1,
        TakingOff = 2,
        Landing = 3,
    };

private:
    std::string m_frame;
    ros::Publisher m_pubNav,pub_targetDrone,pub_cmd,pub_vel;
    tf::TransformListener m_listener;
    PID m_pidX;
    PID m_pidY;
    PID m_pidZ;
    PID m_pidYaw;

    PID m_pidXp;
    PID m_pidYp;

    State m_state;
    geometry_msgs::PoseStamped m_goal,m_po;
    geometry_msgs::Twist m_vel;

    ros::Subscriber m_subscribeGoal,m_PosePid, m_subVel;
    ros::ServiceServer m_serviceTakeoff;
    ros::ServiceServer m_serviceLand;
    float m_thrust;
};

int main(int argc, char **argv)
{
  ros::init(argc, argv, "controller");

  ros::NodeHandle n("~");
  std::string frame;
  n.getParam("frame", frame);
  std::cout << frame << std::endl;
  

  Controller controller(frame, n);

  double frequency;
  n.param("frequency", frequency, 50.0);
  controller.run(frequency);

  // std::thread t(&Controlle::run, &controller);
  // t.detach();

  // ros::spin();

  return 0;
}
