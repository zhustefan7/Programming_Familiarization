#include <ros/ros.h>
#include <ros/console.h>
#include <chatbot_node/reply_msg.h>
#include <message_ui/sent_msg.h>
#include <string>
#include <typeinfo>
using namespace std;

//Add your code here

        
string tmp_sent_msg; 
chatbot_node::reply_msg tmp_rply_msg;


void sent_msg_callback(const message_ui::sent_msg msg)
{
 tmp_sent_msg = msg.message;
//  ROS_INFO("I heard: [%s]", tmp_msg.c_str());
 ROS_INFO("I heard: [%s]", tmp_sent_msg.c_str());
//  ROS_INFO(typeid(msg.message).name());
}




int main(int argc, char **argv) {

    ros::init(argc, argv, "chatbot_node");

    //   ros::NodeHandle n_pub;
    ros::NodeHandle n;

    //Add your code here
    ros::Publisher chatter_pub = n.advertise<chatbot_node::reply_msg>("reply_msg", 1000);
    ros::Subscriber sub = n.subscribe("sent_msg", 1000, sent_msg_callback);
    ros::Rate loop_rate(20);

    // ros::spin();

  while(ros::ok()) {


// //     // PUBLISHER CODE
// //     // std_msgs::String msg;
// //     // std::stringstream ss;
// //     // // ss << "hello world "<< count;
// //     // msg.data = ss.str();


    if (tmp_sent_msg == "Hello"){
        tmp_rply_msg.message = "Hello, Stefan";
    }
    // tmp_rply_msg.message = tmp_sent_msg;
    // cout << tmp_rply_msg.message << endl;
    chatter_pub.publish(tmp_rply_msg);
// //     // ROS_INFO("%s", msg.data.c_str());

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}