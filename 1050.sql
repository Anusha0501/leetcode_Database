#1050. Actors and Directors Who Cooperated At Least Three Times

Select actor_id,director_id
From ActorDirector
GROUP BY actor_id,director_id
Having count(timestamp)>=3 
