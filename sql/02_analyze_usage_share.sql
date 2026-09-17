-- ============================================================
-- 2. Analyze Usage Share
-- ============================================================

-- Business question:
-- Do players rely on Sword more than other abilities?

-- Metric:
-- Usage share = number of times each ability was used /
-- total number of ability uses

SELECT 
    a.ability_name,
    u.ability_id,
    SUM(u.times_used) AS total_uses,
    SUM(u.times_used) * 1.0 /
        (SELECT SUM(times_used)
         FROM kirby_product_analytics.ability_usage) AS usage_share
FROM kirby_product_analytics.ability_usage AS u
JOIN kirby_product_analytics.abilities AS a
    ON u.ability_id = a.ability_id
GROUP BY 
    a.ability_name,
    u.ability_id
ORDER BY usage_share DESC;

-- Finding:
-- Sword had the highest usage share at 22.5%, followed by
-- Fire at 16.9% and Hammer at 12.4%. Leaf and Sleep had
-- the lowest usage shares at 2.4% and 1.1%.
--
-- Compared with adoption rate, usage share shows a more
-- concentrated pattern. Players interacted with many abilities,
-- but some abilities were used more frequently than others.
--
-- This provides a different view of player behavior than
-- adoption rate, but Sword's 22.5% usage share does not support
-- the original assumption of approximately 80% primary usage.
--
-- Next question:
-- Could the original 80% assumption be referring to the
-- share of enemies defeated by each ability?
