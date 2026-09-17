-- ============================================================
-- 03. Investigate Ability Effectiveness
-- ============================================================

-- Business question:
-- Does ability effectiveness help explain differences
-- in player usage?

-- Metric:
-- Average damage dealt per use

SELECT 
    a.ability_name,
    u.ability_id,
    SUM(u.enemies_defeated) AS total_defeated,
    SUM(u.enemies_defeated) * 1.0 /
        (SELECT SUM(enemies_defeated)
         FROM kirby_product_analytics.ability_usage) AS enemy_defeat_share
FROM kirby_product_analytics.ability_usage AS u
JOIN kirby_product_analytics.abilities AS a
    ON u.ability_id = a.ability_id
GROUP BY 
    a.ability_name,
    u.ability_id
ORDER BY enemy_defeat_share DESC;

-- Finding:
-- Enemy defeat share closely follows the overall ranking of usage share.
-- Sword, Fire, Hammer, and Ranger account for the largest shares of
-- enemies defeated, while Leaf and Sleep account for the smallest.
--
-- The similar rankings suggest that abilities used more frequently
-- also tend to account for a larger share of enemies defeated.
--
-- However, this does not explain why players use some abilities
-- more than others.
--
-- Next question:
-- Does ability effectiveness help explain differences in usage?
