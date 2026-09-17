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
-- Sword has the highest usage share at approximately 22.5%,
-- but this is substantially below the assumed 80%.
--
-- This suggests that Sword is the most frequently used ability,
-- but the data does not support the claim that players primarily
-- rely on Sword to the extent originally assumed.
--
-- Next question:
-- Does the 80% assumption represent the share of enemies
-- defeated by each ability?
