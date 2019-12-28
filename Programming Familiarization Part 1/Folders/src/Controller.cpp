#include "Controller.h"
#include <cmath>
#include <iostream>
#include <typeinfo>
#include <math.h>  
#include <cmath>
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
        // int safe_spot = pickSafeSpot(g);
        // Prediction pred= trackProjectile(projectiles,g);

        // for (list<Projectile>::iterator p = projectiles.begin(); p != projectiles.end(); ++p){
        //     Prediction curr_pred = trackProjectile(*p,g);
        // }


        for (int i =0 ; i< g.getPlayers().size();i++){
            players[i] -> x++;
        }


        for(std::vector<Player*>::const_iterator it = g.getPlayers().begin();
			it != g.getPlayers().end(); ++it){
                // Player & p = **it;
                // // cout << p->x;   
                // cout <<     it -> x;
                // p.x ++;
                Player * p = *it;         
                int safe_spot = pickSafeSpot( p, g);
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
        // cout << time_step<<endl;

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


            // cout << y << endl;

            // cout<<vy<<endl;

            if (vy>0){
                time_in_air = 2*vy/gravity + (-vy+sqrt(pow(vy,2)+2*gravity*y));
                // cout<< time_in_air<<endl;
            }
            else if(vy<0){
                vy = abs(vy);
                time_in_air = (-vy+sqrt(pow(vy,2)+2*gravity*y));
            }

            // cout<<time_in_air*time_step<<endl;
            float pred_x = p->x + time_in_air*p->vx*time_step;
            float pred_t = game_time + time_in_air*time_step;
            curr_pred.x = pred_x;
            curr_pred.t = pred_t;
            // cout << pred_x<<endl;
            Predictions.push_back(curr_pred);

        }
		// Prediction pred;
		return Predictions;
	}


	void Controller::determineSafeSpots(vector<Prediction>Predictions, const Game& g)
	{  
        float buffer_time = 2.f;    //in terms of game time
        float game_time = g.getGameTime();
        float explosion_time = g.explosionTime;
        float explosion_size = g.explosionSize;
        float time_step = g.getTimeStep();
        int w = g.getWidth();
        int explosion_radius = g.explosionSize/2;
    

        // cout << unsafe_spots.size()<< endl;

        // delete explosions that are over
        for ( map<int, unordered_set<int>>::iterator it = unsafe_spots.begin(); it != unsafe_spots.end();++it){
            if (game_time- it->first > explosion_time){
                // cout << typeid(it->first).name()<<endl;
                cout << "game time:" << game_time<<endl;
                      if (unsafe_spots.count(it->first)){
                        cout << "deleted time:" << it->first << endl;
                        unsafe_spots.erase(it->first);
                    }
            }
        }

        // populating future impact spots with impact predictions
        for (vector<Prediction>::iterator p = Predictions.begin(); p != Predictions.end(); ++p){
            int impact_spot = int(p->x);
            int impact_time = int(p->t);

            // cout<< "impact spot"<<impact_spot << endl;
            // cout << "impact time " << impact_time << endl;
            // cout << "game time " << game_time << endl;
            // cout<< p->x ;

            if (impact_spot >= explosion_radius && impact_spot < w-explosion_radius){
            // only record impact projectiles that will hit within the next buffer seconds
            if ((impact_time - game_time) < buffer_time){
                // cout << "inserted impact time"<<impact_time << endl;
                if (!unsafe_spots.count(impact_time)){
                        unordered_set<int> tmp; 
                        unsafe_spots.insert({impact_time,tmp});
                }
                for (int i = -explosion_radius; i<= explosion_radius; i++){
                    // cout << "inserted impact time"<<impact_time << "impact spot:" <<impact_spot<<endl;
                    unsafe_spots[impact_time].insert(impact_spot+i);
                    // cout << unsafe_spots[impact_time].size()<< endl;
                }
                }
            }
        }
        return;
	}

	int Controller::pickSafeSpot(Player* p, const Game& g)
	{
        int start_pos = int(p->x);  
        int p1 = start_pos;
        int p2 = start_pos;
        bool p1_safe = true;
        bool p2_safe = true;
        int w = g.getWidth();
        while (true){
            cout << "stuck here" << endl;   
            // cout << p1<<endl;
            // cout << safe_spots[p1]<<endl;
            if (p1 >=0){
                --p1;
            }
            if (p2 <w){
                ++p2;
            }

            for (map<int, unordered_set<int>>::iterator it = unsafe_spots.begin(); it != unsafe_spots.end();++it){
                if (unsafe_spots[it->first].count(p1)){
                    p1_safe = false;
                }
                if (unsafe_spots[it->first].count(p2)){
                    p2_safe = false;
                }
            }

            if (p1_safe) return p1;
            else if (p2_safe) return p2;

            else if (p1 ==0 && p2 == w-1){
                //  cout << "returned C ";
                return start_pos;
            }
        }
		return start_pos;
	}
}
