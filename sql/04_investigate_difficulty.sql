-- ============================================================
-- 04. Investigate Ability Effectiveness and Difficulty
-- ============================================================

-- Business question:
-- Do ability effectiveness or difficulty help explain
-- differences in usage?

-- ------------------------------------------------------------
-- Average Damage per Use
-- ------------------------------------------------------------

-- Metric:
-- Average damage per use = total damage dealt / total times used

SELECT
    a.ability_name,
    u.ability_id,
    SUM(u.damage_dealt) * 1.0 /
        SUM(u.times_used) AS damage_per_use
FROM kirby_product_analytics.ability_usage AS u
JOIN kirby_product_analytics.abilities AS a
    ON u.ability_id = a.ability_id
GROUP BY
    a.ability_name,
    u.ability_id
ORDER BY damage_per_use DESC;

-- Finding:
-- Average damage per use was relatively consistent across abilities,
-- ranging from 127.0 to 130.7 damage per use.
--
-- Sword, the highest used ability, did not have the highest average
-- damage, while Sleep, the least used ability, had the lowest.
--
-- The relatively small difference suggests that damage output alone
-- does not appear sufficient to explain differences in usage.


-- ------------------------------------------------------------
-- Difficulty Rating
-- ------------------------------------------------------------

-- Next question:
-- Does the difficulty of an ability help explain differences in usage?

SELECT
    a.ability_name,
    u.ability_id,
    a.difficulty_rating
FROM kirby_product_analytics.ability_usage AS u
JOIN kirby_product_analytics.abilities AS a
    ON u.ability_id = a.ability_id
GROUP BY
    a.ability_name,
    u.ability_id,
    a.difficulty_rating
ORDER BY a.difficulty_rating ASC;

-- Finding:
-- Difficulty does not show a consistent relationship with usage.
--
-- Sword and Sleep are both rated as the easiest abilities, yet
-- Sword ranks first in usage while Sleep ranks last.
--
-- Hammer has a difficulty rating of 4 but ranks third in usage share,
-- suggesting that higher difficulty does not necessarily correspond
-- to lower usage.
--
-- Next question:
-- Could unlock timing help explain differences in usage?
