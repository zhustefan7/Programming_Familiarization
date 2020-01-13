#include "Controller.h"
#include <cmath>
#include <iostream>
#include <typeinfo>
#include <math.h>  
#include <cmath>
#include <stdlib.h> 
#include <unordered_map> 
#include <unordered_set>
using namespace std;
namespace mrsd
{
	void Controller::control(const mrsd::Game& g, float t)
	{   
        vector<Player*>players = g.getPlayers();
        list<Projectile> Projectiles = g.getProjectiles();
        vector<Prediction> Predictions = trackProjectile(Projectiles,g); 
        determineSafeSpots(Predictions, g);



        for(std::vector<Player*>::const_iterator it = g.getPlayers().begin();
			it != g.getPlayers().end(); ++it){
                Player * p = *it;         
                float safe_spot = pickSafeSpot(p,g);
                // cout << "Player pos:" << p->x << endl;
                cout << "safe spot used:"<<safe_spot << endl;
                p -> x =safe_spot;

            }
	}

	void Controller::createPlayer(Game& g)
	{
		if(p == 0)
		{
			p = new Player();
			p->dead = true;
		}
		if(p->dead)
		{
			p->dead = false;
			p->x = g.getWidth()/2;
			g.newPlayer(p);
		}
	}

	vector<Prediction> Controller::trackProjectile(list<Projectile>& Projectiles, const Game& g)
	{
        vector<Prediction> Predictions;
        float time_step = g.getTimeStep();

        for (list<Projectile>::iterator p = Projectiles.begin(); p != Projectiles.end(); ++p){
            // Projectile curr_proj = *p;
            Prediction curr_pred;

            float gravity = -g.getGravity();
            float game_time = g.getGameTime();
            // cout<<game_time<<endl;
            float time_in_air;
            float vy,y; 
            vy = p->vy;
            y = p->y;

            if (vy>0){
                time_in_air = 2*vy/gravity + (-vy+sqrt(pow(vy,2)+2*gravity*y))/gravity;
            }
            else if(vy<0){
                vy = abs(vy);
                time_in_air = (-vy+sqrt(pow(vy,2)+2*gravity*y))/gravity;
            }
            float pred_x = p->x + time_in_air*p->vx;
            float pred_t = game_time + time_in_air*time_step;
            curr_pred.x = pred_x;
            curr_pred.t = pred_t;
            Predictions.push_back(curr_pred);

        }
		// Prediction pred;
		return Predictions;
	}


	void Controller::determineSafeSpots(vector<Prediction>Predictions, const Game& g)
	{  
        float buffer_time = 2.0f;    //in terms of game time
        float game_time = g.getGameTime();
        float explosion_time = g.explosionTime;
        float explosion_size = g.explosionSize;
        float time_step = g.getTimeStep();
        int w = g.getWidth();
        int explosion_radius = g.explosionSize/2+5;

        // delete explosions that are over
        for ( map<int, unordered_set<float>>::iterator it = unsafe_spots.begin(); it != unsafe_spots.end();++it){
            if (game_time- it->first > explosion_time ){
                // cout << typeid(it->first).name()<<endl;
                // cout << "game time:" << game_time<<endl;
                      if (unsafe_spots.count(it->first)){
                        // cout << "deleted time:" << it->first << endl;
                        unsafe_spots.erase(it->first);
                    }
            }
        }

        // populating future impact spots with impact predictions
        for (vector<Prediction>::iterator p = Predictions.begin(); p != Predictions.end(); ++p){
            int impact_spot = int(p->x);
            float impact_time = p->t;
            cout<< "impact spot"<<impact_spot << endl; 

            if (impact_spot >= explosion_radius && impact_spot < w-explosion_radius){
            // only record impact projectiles that will hit within the next buffer seconds
            if ((impact_time - game_time) < buffer_time){
                // cout << "inserted impact time"<<impact_time << endl;
                if (!unsafe_spots.count(impact_time)){
                        unordered_set<float> tmp; 
                        unsafe_spots.insert({impact_time,tmp});
                }
                for (int i = -explosion_radius; i<= explosion_radius; i++){
                    unsafe_spots[impact_time].insert(impact_spot+i);
                    // cout << unsafe_spots[impact_time].size()<< endl;
                }
                }
            }
        }
        return;
	}



    float Controller::pickSafeSpot(Player* p, const Game& g)
	{
        float start_pos = p->x;  
        float p1 = start_pos;
        float p2 = start_pos;
        bool p1_safe = false;
        bool p2_safe = false;
        bool start_pos_safe = false;
        float ps = g.playerSpeed;
        int w = g.getWidth();

        while (!p1_safe && !p2_safe && !start_pos_safe){
        if (p1 >=0){
            p1-=ps;   
        }
        if (p2 <w){
            p2+=ps;
        }
        if (unsafe_spots.size()==0) break;
        // cout<<unsafe_spots.size();


        for (map<int, unordered_set<float>>::iterator it = unsafe_spots.begin(); it != unsafe_spots.end();++it){
            if (!unsafe_spots[it->first].count(int(round(start_pos)))){
                cout << "returned from start pos" << endl;
                start_pos_safe = true;
                break;
            }   
            if (!unsafe_spots[it->first].count(int(round(p1)))){
                p1_safe = true;
                cout << "returned from p1" << endl;
                break;
            }
            if (!unsafe_spots[it->first].count(int(round(p2)))){
                p2_safe = true;
                cout << "returned from p2" << endl;
                break;
            }
        }
        }

        if (start_pos_safe) return start_pos;
        else if (p1_safe) return start_pos-ps;
        else if (p2_safe) return start_pos+ps;
        return start_pos;
	}
}
