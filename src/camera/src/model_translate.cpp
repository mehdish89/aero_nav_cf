#include <ros/ros.h>
#include <gazebo_msgs/ModelStates.h>
#include <apriltags_ros/AprilTagDetectionArray.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

using namespace std;


ros::Publisher pub;
tf::TransformListener listener;


void update(const apriltags_ros::AprilTagDetectionArray::ConstPtr& msg)
{
	gazebo_msgs::ModelStates out;
	out.name.push_back("first"); 
	out.name.push_back("daedalus");
	out.pose.push_back(geometry_msgs::Pose());
	out.pose.push_back(geometry_msgs::Pose());
	//cout << msg->detections.size() << endl;

	tf::StampedTransform transformed;
	listener.lookupTransform("/tag_1", "/tag_0", ros::Time(0), transformed);

	int count = 0;
		
	for(int i=0;i<msg->detections.size();i++)
		if(msg->detections[i].id==0 || msg->detections[i].id==0)
			count++;
			
	if(count>=2) {
		out.pose[1].position.x = transformed.getOrigin().x();
		out.pose[1].position.y = transformed.getOrigin().y();
		out.pose[1].position.z = transformed.getOrigin().z();
		
		out.pose[1].orientation.x = transformed.getRotation().x();
		out.pose[1].orientation.y = transformed.getRotation().y();
		out.pose[1].orientation.z = transformed.getRotation().z();
		out.pose[1].orientation.w = transformed.getRotation().w();
		pub.publish(out);
	}
	
}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "model_translate");
	ros::NodeHandle n;
	pub = n.advertise<gazebo_msgs::ModelStates>("/gazebo/model_states", 1);
	ros::Subscriber sub = n.subscribe("/tag_detections", 1, update);
	
	ros::Rate rate(10.0);
	ros::spin();
}


