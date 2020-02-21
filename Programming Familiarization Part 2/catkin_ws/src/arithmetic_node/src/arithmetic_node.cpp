#include <ros/ros.h>
#include <ros/console.h>
#include <chatbot_node/reply_msg.h>
#include <message_ui/sent_msg.h>
#include <stack> 
#include <arithmetic_node/arithmetic_reply.h>
// #include<boost/format.hpp>

#include <string>
#include <typeinfo>
using namespace std;




class arithmetic{
    private:
        string tmp_sent_msg; 
        string oper_type;
        float answer;
        float time_received;
        float time_answered;
        float process_time;
        arithmetic_node:: arithmetic_reply arithmetic_reply_msg; 

        ros::Publisher chatter_pub;
        ros::Subscriber sub;

    public:
    arithmetic(ros::NodeHandle *n){
        chatter_pub = n->advertise<arithmetic_node::arithmetic_reply>("arithmetic_reply", 1000);
        sub = n->subscribe("sent_msg", 1000, &arithmetic::sent_msg_callback,this);
    }

    float calculator(string s){
    stack <int> operand;  
    int result = 0 ;
    int num = 0;         
    int top = 0;
    char sign = '+';
    for (int i=0;i<s.length();i++){
        char c = s[i];
        if (isdigit(c)){
            num = num * 10 + c-48;
        }
        if(i==s.size()-1 || (c == '+' || c=='-' || c=='*' || c=='/')){
            if (sign=='+'){
                operand.push(num);
                oper_type = "Add";
            }
            else if (sign=='-'){
                operand.push(-num);
                oper_type = "Subtract";
            }
            else if (sign == '*'){
                top = operand.top();
                operand.pop();
                operand.push(top*num);
                oper_type = "Multiply";
            }
            else if (sign =='/'){
                top = operand.top();
                operand.pop();
                operand.push(top/num);
                oper_type = "Divide";
            }
            num = 0;
            sign = c;   
        }
    }
    while (!operand.empty()){
        result = result + operand.top();
        operand.pop();
    }
    return result;
    }  
    
    void sent_msg_callback(const message_ui::sent_msg msg)
        {
        tmp_sent_msg = msg.message;
        ROS_INFO("I heard from arithmetics node: [%s]", tmp_sent_msg.c_str());

        time_received =ros::Time::now().toSec();
        answer = this->calculator(tmp_sent_msg);
        time_answered = ros::Time::now().toSec();
        process_time = time_answered - time_received;

        ROS_INFO("process_time", process_time);

        arithmetic_reply_msg.time_received = time_received;
        arithmetic_reply_msg.answer = answer; 
        arithmetic_reply_msg.time_answered = time_answered; 
        arithmetic_reply_msg.process_time = process_time; 
        arithmetic_reply_msg.oper_type = oper_type;
        arithmetic_reply_msg.header.stamp = ros::Time::now();
        if (isdigit(tmp_sent_msg[0])){
            chatter_pub.publish(arithmetic_reply_msg);
        }
        }   
};




int main(int argc, char **argv) {
    
    ros::init(argc, argv, "arithmetic_node");
    ros::NodeHandle n;
    ros::Rate loop_rate(20);
    arithmetic* a = new arithmetic(&n);


    while(ros::ok()) {
        ros::spinOnce();
        loop_rate.sleep();
    }


    delete a;
    return 0;
}