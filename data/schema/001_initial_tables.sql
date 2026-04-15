-- RADAR v1 initial tables
-- Keep this first schema small and factual.

CREATE TABLE IF NOT EXISTS teams (
    id TEXT PRIMARY KEY,
    external_team_id TEXT,
    team_name TEXT NOT NULL,
    short_name TEXT,
    country TEXT,
    last_updated_at TEXT
);

CREATE TABLE IF NOT EXISTS matches (
    id TEXT PRIMARY KEY,
    external_match_id TEXT,
    competition_id TEXT,
    competition_name TEXT NOT NULL,
    season_label TEXT,
    match_datetime TEXT NOT NULL,
    home_team_id TEXT NOT NULL,
    away_team_id TEXT NOT NULL,
    home_team_name TEXT NOT NULL,
    away_team_name TEXT NOT NULL,
    home_score_ft INTEGER,
    away_score_ft INTEGER,
    home_score_ht INTEGER,
    away_score_ht INTEGER,
    status TEXT NOT NULL,
    last_updated_at TEXT,
    FOREIGN KEY (home_team_id) REFERENCES teams(id),
    FOREIGN KEY (away_team_id) REFERENCES teams(id)
);

CREATE TABLE IF NOT EXISTS team_match_stats (
    id TEXT PRIMARY KEY,
    match_id TEXT NOT NULL,
    team_id TEXT NOT NULL,
    opponent_team_id TEXT NOT NULL,
    is_home INTEGER NOT NULL,
    goals_scored INTEGER,
    goals_conceded INTEGER,
    btts_yes_no INTEGER,
    over25_yes_no INTEGER,
    yellow_cards INTEGER,
    red_card_yes_no INTEGER,
    source_updated_at TEXT,
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (team_id) REFERENCES teams(id),
    FOREIGN KEY (opponent_team_id) REFERENCES teams(id)
);

CREATE TABLE IF NOT EXISTS head_to_head_records (
    id TEXT PRIMARY KEY,
    team_a_id TEXT NOT NULL,
    team_b_id TEXT NOT NULL,
    match_id TEXT NOT NULL,
    match_datetime TEXT NOT NULL,
    home_team_id TEXT NOT NULL,
    away_team_id TEXT NOT NULL,
    home_score_ft INTEGER,
    away_score_ft INTEGER,
    home_score_ht INTEGER,
    away_score_ht INTEGER,
    btts_yes_no INTEGER,
    over25_yes_no INTEGER,
    total_yellow_cards INTEGER,
    red_card_yes_no INTEGER,
    freshness_bucket TEXT,
    FOREIGN KEY (match_id) REFERENCES matches(id)
);

CREATE TABLE IF NOT EXISTS sync_state (
    id TEXT PRIMARY KEY,
    entity_type TEXT NOT NULL,
    entity_scope TEXT NOT NULL,
    last_sync_at TEXT,
    last_success_at TEXT,
    sync_status TEXT NOT NULL,
    source_name TEXT,
    error_note TEXT
);

CREATE INDEX IF NOT EXISTS idx_matches_datetime ON matches(match_datetime);
CREATE INDEX IF NOT EXISTS idx_team_match_stats_match_id ON team_match_stats(match_id);
CREATE INDEX IF NOT EXISTS idx_team_match_stats_team_id ON team_match_stats(team_id);
CREATE INDEX IF NOT EXISTS idx_h2h_team_pair ON head_to_head_records(team_a_id, team_b_id);
CREATE INDEX IF NOT EXISTS idx_sync_state_scope ON sync_state(entity_type, entity_scope);
