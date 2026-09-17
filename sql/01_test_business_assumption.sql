-- ============================================================
-- 1. Test the Initial Business Assumption
-- ============================================================

-- Business question:
-- What percentage of players use each Copy Ability?

-- First, count the unique players who used each ability.

SELECT
    ability_id,
    COUNT(DISTINCT player_id) AS unique_players
FROM kirby_product_analytics.ability_usage
GROUP BY ability_id;


-- Calculate adoption rate:
-- players who used the ability / total unique players

SELECT
    a.ability_name,
    u.ability_id,
    COUNT(DISTINCT u.player_id) AS unique_players,
    COUNT(DISTINCT u.player_id) * 1.0 /
        (SELECT COUNT(DISTINCT player_id)
         FROM kirby_product_analytics.ability_usage) AS adoption_rate
FROM kirby_product_analytics.ability_usage AS u
JOIN kirby_product_analytics.abilities AS a
    ON u.ability_id = a.ability_id
GROUP BY
    a.ability_name,
    u.ability_id
ORDER BY adoption_rate DESC;

-- Finding:
-- Most abilities were used by at least 80% of players, with
-- Sword and Fire reaching 100% adoption. Leaf and Sleep had
-- the lowest adoption rates at 68.4% and 42.2%.
--
-- This does not support the assumption that Sword is uniquely
-- adopted by most players. Instead, adoption is relatively broad
-- across abilities.
--
-- Next question:
-- If many players use multiple abilities, how frequently is
-- each ability actually used?
