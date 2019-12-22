#include "Controller.h"
#include <cmath>
#include <iostream>
#include <typeinfo>
#include <math.h>  
#include <cmath>
using namespace std;
namespace mrsd
{
	void Controller::control(const mrsd::Game& g, float t)
	{
        vector<Player*>players = g.getPlayers();
        list<Projectile> Projectiles = g.getProjectiles();
        vector<Prediction> Predictions = trackProjectile(Projectiles,g); 
        vector<int> safe_spots = determineSafeSpots(Predictions, g);
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
                int safe_spot = pickSafeSpot(safe_spots, p, g);
                // cout << "safe spot used:"<<safe_spot << endl;
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

	vector<int> Controller::determineSafeSpots(vector<Prediction>Predictions, const Game& g)
	{  
        float buffer_time = 2.f;    //in terms of game time
        float game_time = g.getGameTime();
        float time_step = g.getTimeStep();
        int w = g.getWidth();

        float explosion_size = g.explosionSize;
        vector<int> safe_spots(w,1);
        for (vector<Prediction>::iterator p = Predictions.begin(); p != Predictions.end(); ++p){
            int impact_spot = int(p->x);
            float impact_time = p->t;

            cout<< "impact spot"<<impact_spot << endl;
            // cout << "impact time " << impact_time << endl;
            // cout << "game time " << game_time << endl;
            // cout<< p->x ;

            if (impact_spot >= g.explosionSize/2 && impact_spot < w-g.explosionSize/2){
            if ((impact_time - game_time) < buffer_time){
                safe_spots[impact_spot+3]= 0;
                safe_spots[impact_spot-3]= 0;
                safe_spots[impact_spot+2]= 0;
                safe_spots[impact_spot-2]= 0;
                safe_spots[impact_spot+1]= 0;
                safe_spots[impact_spot-1]= 0;
                safe_spots[impact_spot]= 0;
            }
            }
        }
        return safe_spots;
	}

	int Controller::pickSafeSpot(vector<int> safe_spots, Player* p, const Game& g)
	{
        int start_pos = int(p->x); 
        int p1 = start_pos;
        int p2 = start_pos;
        int w = g.getWidth();
        while (true){
            // cout << p1<<endl;
            // cout << safe_spots[p1]<<endl;
            if (p1 >=0){
                --p1;
                if (safe_spots[p1]){
                    // cout << "returned A ";
                    return p1;
                }
            }
            if (p2 <w){
                ++p2;
                if (safe_spots[p2]){
                    // cout << "returned B ";
                return p2;
                }
            }

            if (p1 ==0 && p2 == w-1){
                //  cout << "returned C ";
                return start_pos;
            }
        }
		return start_pos;
	}
}
