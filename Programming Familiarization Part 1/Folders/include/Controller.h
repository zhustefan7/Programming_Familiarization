#pragma once
#include "Player.h"
#include "Game.h"
#include <unordered_map> 
#include <unordered_set> 
#include <map>
#include <vector>
using namespace std;
namespace mrsd
{
	struct Prediction
	{
		float t, x;
	};
	class Controller
	{
		public:
            map <int, unordered_set<float>> unsafe_spots;
			Controller():p(0){}
			/**
			 * Control AI based on state of game. "t" time has passed since last update.
			 **/
			void control(const Game& g, float t);
			/*
			 * Construct Player and add to game.
			 */
			void createPlayer(Game& g);
		private:
			Player* p;
			float currentTime;
			/*
			 * Track projectile and determine where and when it will hit ground.
			 */
			vector<Prediction> trackProjectile(list<Projectile>& Projectiles, const Game& g);

			/*
			 * Determine safe spots at time t based on state of all observed projectiles.
			 */
			void determineSafeSpots(vector<Prediction>Predictions, const Game& g);

			/*
			 * Pick safe spot from determined safe spots.
			 */
			float pickSafeSpot( Player* p, const Game& g);
	};
}
