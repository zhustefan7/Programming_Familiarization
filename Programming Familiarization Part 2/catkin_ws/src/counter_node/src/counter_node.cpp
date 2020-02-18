#include <ros/ros.h>
#include <chatbot_node/reply_msg.h>
#include <message_ui/sent_msg.h>
#include <counter_node/counter.h>
#include <stack> 

using namespace std;
#include <arithmetic_node/arithmetic_reply.h>

int num_reply_msg = 0;
int num_sent_msg = 0;

ros::Time last_sent_msg_time;
ros::Time last_reply_msg_time;

ros::Subscriber reply_msg_sub;
ros::Subscriber arithmetic_reply_msg_sub;
ros::Subscriber sent_msg_sub;

bool counterCallback(counter_node::counter::Request &req,
                     counter_node::counter::Response &res){
    // cout << req << endl;
    ros::Time secs =ros::Time::now();
    if (req.req_id == 0){
        res.reply = num_reply_msg+ num_sent_msg;
    }
    else if (req.req_id == 1){
        res.reply = num_reply_msg;
    }
    else if (req.req_id == 2){
        res.reply = num_sent_msg;
    }
    else if (req.req_id == 3){
        res.reply = (secs - last_reply_msg_time).toSec();
    }
    else if (req.req_id == 4){
        cout << last_sent_msg_time << endl;
        res.reply = (secs - last_sent_msg_time).toSec();
    }


    // res.reply= req.req_id;
    return 1;
}

void sent_msg_callback(const message_ui::sent_msg msg)
{
	num_sent_msg++;
	last_sent_msg_time = msg.header.stamp;
}

void reply_msg_callback(const chatbot_node::reply_msg msg)
{
	num_reply_msg++;
    cout << num_reply_msg << endl;
	last_reply_msg_time = msg.header.stamp;
}

void arithmetic_reply_msg_callback(const arithmetic_node::arithmetic_reply msg)
{
	num_reply_msg++;
	last_reply_msg_time = msg.header.stamp;
} 

int main(int argc, char **argv) {

  ros::init(argc, argv, "counter_node");
  ros::NodeHandle n;
  ros::Publisher chatter_pub =n.advertise<chatbot_node::reply_msg>("reply_msg", 1000);
  reply_msg_sub = n.subscribe("reply_msg", 1000, reply_msg_callback);
  sent_msg_sub = n.subscribe("sent_msg", 1000, sent_msg_callback);
  ros::ServiceServer service = n.advertiseService("message_counter", counterCallback);
  // arithmetic_reply_msg_sub = n.subscribe("arithmetic_reply", 1000, arithmetic_reply_msg_callback);

  ros::Rate loop_rate(20);

  while(ros::ok()) {
    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
