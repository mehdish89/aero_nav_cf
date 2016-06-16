#pragma once

#include <ros/ros.h>



class PID
{

    double get(
        const ros::NodeHandle& n,
        const std::string& name) {
        double value;
        n.getParam(name, value);
        return value;
    }
public:
    PID(
        const std::string& kp,
        const std::string& kd,
        const std::string& ki,
        const std::string& minOutput,
        const std::string& maxOutput,
        const std::string& integratorMin,
        const std::string& integratorMax,
        const std::string& name,
        ros::NodeHandle nh
        )
        : 
          m_kp(0)
        , m_kd(0)
        , m_ki(0)
        , m_minOutput(0)
        , m_maxOutput(0)
        , m_integratorMin(0)
        , m_integratorMax(0)
        , m_integral(0)
        , m_previousError(0)
        , m_previousTime(ros::Time::now())
        , m_name(name)
        , m_nh(nh)
    {
    }

    void reset()
    {
        m_integral = 0;
        m_previousError = 0;
        m_previousTime = ros::Time::now();
    }

    void setIntegral(float integral)
    {
        m_integral = integral;
    }

    float ki() const
    {
        return m_ki;
    }

    float update(float value, float targetValue)
    {

        m_kp = get(m_nh, "PIDs/" + m_name + "/kp");
        m_kd = get(m_nh, "PIDs/" + m_name + "/kd");
        m_ki = get(m_nh, "PIDs/" + m_name + "/ki");
        m_minOutput = get(m_nh, "PIDs/" + m_name + "/minOutput");
        m_maxOutput = get(m_nh, "PIDs/" + m_name + "/maxOutput");
        m_integratorMin = get(m_nh, "PIDs/" + m_name + "/integratorMin");
        m_integratorMax = get(m_nh, "PIDs/" + m_name + "/integratorMax");
        
        ros::Time time = ros::Time::now();
        float dt = time.toSec() - m_previousTime.toSec();
        float error = targetValue - value;
        m_integral += error * dt;
        m_integral = std::max(std::min(m_integral, m_integratorMax), m_integratorMin);
        float p = m_kp * error;
        float d = 0;
        if (dt > 0)
        {
            d = m_kd * (error - m_previousError) / dt;
        }
        float i = m_ki * m_integral;
        float output = p + d + i;
        m_previousError = error;
        m_previousTime = time;
        // self.pubOutput.publish(output)
        // self.pubError.publish(error)
        // self.pubP.publish(p)
        // self.pubD.publish(d)
        // self.pubI.publish(i)
        return std::max(std::min(output, m_maxOutput), m_minOutput);
    }

private:
    float m_kp;
    float m_kd;
    float m_ki;
    float m_minOutput;
    float m_maxOutput;
    float m_integratorMin;
    float m_integratorMax;
    float m_integral;
    float m_previousError;
    ros::Time m_previousTime;
    ros::NodeHandle m_nh;
    std::string m_name;
};
