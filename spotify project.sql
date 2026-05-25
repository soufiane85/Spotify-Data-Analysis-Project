-- SPOTIFY DATA ANALYSIS PROJECT
-- SQL + TABLEAU PROJECT
-- =========================================

-- =========================================
-- 1. CREATE DATABASE
-- =========================================

CREATE DATABASE spotify_project;

USE spotify_project;

-- =========================================
-- 2. CHECK DATA
-- =========================================

SELECT *
FROM spotify
LIMIT 10;

-- =========================================
-- 3. COUNT TOTAL SONGS
-- =========================================

SELECT COUNT(*) AS total_songs
FROM spotify;

-- =========================================
-- 4. CHECK FOR NULL VALUES
-- =========================================

SELECT *
FROM spotify
WHERE popularity IS NULL;

-- =========================================
-- 5. FIND DUPLICATE SONGS
-- =========================================

SELECT name, COUNT(*) AS duplicate_count
FROM spotify
GROUP BY name
HAVING COUNT(*) > 1;

-- =========================================
-- 6. SONG DURATION IN MINUTES
-- =========================================

SELECT
     name,
    artists,
    ROUND(duration_ms / 60000.0, 2) AS duration_minutes
FROM spotify;

-- =========================================
-- 7. TOP 10 MOST POPULAR SONGS
-- =========================================
select 
      artists,
	  name,
      popularity
      
from spotify
order by popularity desc
limit 10;

-- =========================================
-- 8. TOP 10 ARTISTS WITH MOST SONGS
-- =========================================

select 
      artists,
	  count(*) as total_songs
from spotify      
group by artists
order by total_songs desc
limit 10;

-- =========================================
-- 9. MOST COMMON GENRES
-- =========================================

select genre, count(*) as total_songs
from spotify
group by genre 
order by total_songs desc;

-- =========================================
-- 10. AVERAGE POPULARITY BY GENRE
-- =========================================

SELECT
    genre,
    ROUND(AVG(popularity), 2) AS avg_popularity
FROM spotify
GROUP BY genre
ORDER BY avg_popularity DESC;

-- =========================================
-- 11. EXPLICIT VS NON-EXPLICIT SONGS
-- =========================================

select explicit, count(*) as total_songs
from spotify
group by explicit;

-- =========================================
-- 12. AVERAGE SONG DURATION BY GENRE
-- =========================================

SELECT
    genre,
    ROUND(AVG(duration_ms) / 60000, 2) AS avg_duration_minutes
from spotify
group by genre
order by avg_duration_minutes desc;

-- =========================================
-- 16. LEAST POPULAR SONGS
-- =========================================

SELECT
    name,
    artists,
    popularity
FROM spotify
ORDER BY popularity ASC
LIMIT 10;

-- =========================================
-- 18. SONGS LONGER THAN 5 MINUTES
-- =========================================

SELECT
    name,
    artists,
    ROUND(duration_ms / 60000, 2) AS duration_minutes
FROM spotify
WHERE duration_ms > 300000
ORDER BY duration_ms DESC;

-- =========================================
-- 19. CREATE VIEW FOR TABLEAU
-- =========================================


CREATE VIEW spotify_dashboard AS
SELECT
    name,
    artists,
    genre,
    popularity,
    explicit,
    ROUND(duration_ms / 60000, 2) AS duration_minutes
FROM spotify;

-- =========================================
-- 20. VIEW DATA FOR TABLEAU
-- =========================================
SELECT *
FROM spotify_dashboard;

-- =========================================
-- END OF PROJECT
-- =========================================
