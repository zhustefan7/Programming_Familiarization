#include <ros/ros.h>
#include <ros/console.h>
#include <chatbot_node/reply_msg.h>
#include <message_ui/sent_msg.h>
#include <stack> 
// #include<boost/format.hpp>

#include <string>
#include <typeinfo>
using namespace std;

string tmp_sent_msg; 
string tmp_oper_type;




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
            // cout<<num<<endl;
        }
        if(i==s.size()-1 || (c == '+' || c=='-' || c=='*' || c=='/')){
            if (sign=='+'){
                operand.push(num);
                tmp_oper_type = "Add";
            }
            else if (sign=='-'){
                operand.push(-num);
                tmp_oper_type = "Subtract";
            }
            else if (sign == '*'){
                top = operand.top();
                operand.pop();
                operand.push(top*num);
                tmp_oper_type = "Multiply";
            }
            else if (sign =='/'){
                top = operand.top();
                operand.pop();
                operand.push(top/num);
                tmp_oper_type = "Divide";
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
 ROS_INFO("I heard: [%s]", tmp_sent_msg.c_str());
}




int main(int argc, char **argv) {
    
    ros::init(argc, argv, "arithmetic_node");

    ros::NodeHandle n;

    //Add your code here
    ros::Publisher chatter_pub = n.advertise<chatbot_node::reply_msg>("arithmetic_reply", 1000);
    ros::Subscriber sub = n.subscribe("sent_msg", 1000, sent_msg_callback);
    
    float answer = calculator(tmp_sent_msg);
    string oper_type = tmp_oper_type;

    ros::Rate loop_rate(20);
    while(ros::ok()) {

        // if (tmp_sent_msg == "Hello"){
        //     n.getParam("name", name);
        //     cout << name << endl;
        //     tmp_rply_msg.message = format("Hello, %s      ", name.c_str());
        // }
        // else if (tmp_sent_msg == "What is your name?"){
        //     tmp_rply_msg.message = "My name is MRSD Siri";
        // }
        // else if (tmp_sent_msg == "How are you?"){
        //     tmp_rply_msg.message = "I'm fine,thank you";
        // }


        // chatter_pub.publish(tmp_rply_msg);

        ros::spinOnce();
        loop_rate.sleep();
    }

  return 0;
}