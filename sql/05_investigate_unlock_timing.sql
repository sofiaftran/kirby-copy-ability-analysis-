-- ============================================================
-- 05. Investigate Unlock Timing
-- ============================================================

-- Business question:
-- Does the point at which an ability becomes available help
-- explain differences in usage?

SELECT
    a.ability_name,
    u.ability_id,
    a.unlock_world
FROM kirby_product_analytics.ability_usage AS u
JOIN kirby_product_analytics.abilities AS a
    ON u.ability_id = a.ability_id
GROUP BY
    a.ability_name,
    u.ability_id,
    a.unlock_world
ORDER BY a.unlock_world ASC;

-- Finding:
-- Sword and Fire are both unlocked in World 1 and are also the
-- highest used abilities. However, unlock timing does not
-- consistently match usage.
--
-- Ranger is the last ability to unlock in World 5 but ranks fourth
-- in usage share, while Sleep is unlocked relatively early in
-- World 2 yet ranks last in usage share.
--
-- This suggests that earlier availability alone does not explain
-- differences in ability usage.
--
-- Next question:
-- Are certain attack types associated with lower or higher usage?
