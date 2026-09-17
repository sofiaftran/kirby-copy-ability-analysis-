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
