#include <ros/ros.h>
#include <ros/console.h>
#include <chatbot_node/reply_msg.h>
#include <message_ui/sent_msg.h>
// #include<boost/format.hpp>

#include <string>
#include <typeinfo>
using namespace std;

//Add your code here

        
// string tmp_sent_msg; 
// chatbot_node::reply_msg tmp_rply_msg;
// string name; 


std::string format(const char* format, ...)
{
    va_list args;
    va_start(args, format);
    #ifndef _MSC_VER
        size_t size = std::snprintf( nullptr, 0, format, args) + 1; // Extra space for '\0'
        std::unique_ptr<char[]> buf( new char[ size ] ); 
        std::vsnprintf( buf.get(), size, format, args);
        return std::string(buf.get(), buf.get() + size - 1 ); // We don't want the '\0' inside
    #else
        int size = _vscprintf(format, args);
        std::string result(++size, 0);
        vsnprintf_s((char*)result.data(), size, _TRUNCATE, format, args);
        return result;
    #endif
    va_end(args);
}


class chatbot{
    private: 
    string tmp_sent_msg; 
    chatbot_node::reply_msg tmp_rply_msg;
    string name; 
    ros::Publisher chatter_pub;


    //Add your code here
    // ros::Publisher chatter_pub = n.advertise<chatbot_node::reply_msg>("reply_msg", 1000);
    // ros::Subscriber sub = n.subscribe("sent_msg", 1000, sent_msg_callback);
    // ros::Rate loop_rate(20);
    public:
    chatbot(ros::NodeHandle *n){
        ros::Publisher chatter_pub = n->advertise<chatbot_node::reply_msg>("reply_msg", 1000);
        ros::Subscriber sub = n->subscribe("sent_msg", 1000, sent_msg_callback,this);
        n->getParam("name", name);
        // ros::Rate loop_rate(20);
    }

    void sent_msg_callback(const message_ui::sent_msg msg)
        {
            tmp_sent_msg = msg.message;
            ROS_INFO("I heard: [%s]", tmp_sent_msg.c_str());
            if (tmp_sent_msg == "Hello"){
                // n.getParam("name", name);
                // cout << name << endl;
                tmp_rply_msg.message = format("Hello, %s      ", name.c_str());
            }
            else if (tmp_sent_msg == "What is your name?"){
                tmp_rply_msg.message = "My name is MRSD Siri";
            }
            else if (tmp_sent_msg == "How are you?"){
                tmp_rply_msg.message = "I'm fine,thank you";
            }
            chatter_pub.publish(tmp_rply_msg);
            return;
        }

};

// void sent_msg_callback(const message_ui::sent_msg msg)
// {
//     tmp_sent_msg = msg.message;
//     ROS_INFO("I heard: [%s]", tmp_sent_msg.c_str());
// }




int main(int argc, char **argv) {
    ros::init(argc, argv, "chatbot_node");
    ros::NodeHandle n;
    ros::Rate loop_rate(20);

    

    // //   ros::NodeHandle n_pub;
    // ros::NodeHandle n;

    // //Add your code here
    // ros::Publisher chatter_pub= n.advertise<chatbot_node::reply_msg>("reply_msg", 1000);
    // ros::Subscriber sub = n.subscribe("sent_msg", 1000, sent_msg_callback);
    // ros::Rate loop_rate(20);
    
    chatbot* bot = new chatbot(&n);


    while(ros::ok()) {

        // if (tmp_sent_msg == "Hello"){
        //     n.getParam("name", name);
        //     // cout << name << endl;
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
    delete bot;
    return 0;
}