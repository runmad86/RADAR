-- RADAR v1 derived summaries
-- These tables are derived from factual tables and can be rebuilt.

CREATE TABLE IF NOT EXISTS team_form_summaries (
    team_id TEXT PRIMARY KEY,
    sample_size INTEGER NOT NULL,
    goals_scored_rate REAL,
    goals_conceded_rate REAL,
    btts_rate REAL,
    over25_rate REAL,
    yellow_card_rate REAL,
    red_card_rate REAL,
    updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS matchup_summaries (
    id TEXT PRIMARY KEY,
    team_a_id TEXT NOT NULL,
    team_b_id TEXT NOT NULL,
    sample_size INTEGER NOT NULL,
    goal_pattern_strength TEXT,
    heat_pattern_strength TEXT,
    first_half_activity_strength TEXT,
    freshness_level TEXT,
    updated_at TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_matchup_summaries_team_pair
ON matchup_summaries(team_a_id, team_b_id);
