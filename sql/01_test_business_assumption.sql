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
-- The adoption rate does not support the original assumption
-- that 80% of players primarily use Sword.
--
-- Adoption measures whether players tried/used an ability,
-- but does not measure how heavily players rely on it.
--
-- Next question:
-- How much of total ability usage does each ability represent?
