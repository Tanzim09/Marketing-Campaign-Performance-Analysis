use campaign_db;

-- Let's check how many campaigns we have per campaign type. This will help us see which type is used most often.
SELECT Campaign_Type, COUNT(*) AS Total_Campaigns
FROM campaign_summary
GROUP BY Campaign_Type;

-- Time to find the top 5 campaigns that made the most money in terms of ROI.
SELECT TOP 5 Campaign_ID, Company, ROI
FROM campaign_summary
ORDER BY ROI DESC;

-- Want to see where most people are seeing these ads. Checking top 5 locations with the highest impressions.
SELECT TOP 5 Location, SUM(Impressions) AS Total_Impressions
FROM campaign_summary
GROUP BY Location
ORDER BY Total_Impressions DESC

-- Want to see how clicks accumulate over time. This gives us a running total.
SELECT Date, SUM(Clicks) OVER (ORDER BY Date) AS Running_Total_Clicks
FROM campaign_summary;

-- Trying to find the best-performing campaigns by ROI within each location.
SELECT Campaign_ID, Location, ROI, 
       RANK() OVER (PARTITION BY Location ORDER BY ROI DESC) AS ROI_Rank
FROM campaign_summary;

-- Filtering out campaigns where the cost per click (CPC) is higher than average. Helps identify expensive campaigns.
SELECT Campaign_ID, Company, CPC
FROM campaign_summary
WHERE CPC > (SELECT AVG(CPC) FROM campaign_summary);

-- Want to find the campaign with the highest engagement score for each channel type.
SELECT Campaign_ID, Channel_Used, Engagement_Score,
       DENSE_RANK() OVER (PARTITION BY Channel_Used ORDER BY Engagement_Score DESC) AS Engagement_Rank
FROM campaign_summary;

-- For each company, find the campaign that had the highest ROI.
SELECT Campaign_ID, Company, ROI,
       MAX(ROI) OVER (PARTITION BY Company) AS Max_Company_ROI
FROM campaign_summary;

-- Looking for the best marketing channel per target audience based on ROI.
SELECT c1.Target_Audience, c1.Channel_Used, c1.ROI
FROM campaign_summary c1
WHERE ROI = (
    SELECT MAX(ROI) FROM campaign_summary c2 
    WHERE c1.Target_Audience = c2.Target_Audience
);

-- Filtering campaigns that have a CTR above 5%, because those are likely performing well.
SELECT Campaign_ID, Channel_Used, CTR
FROM campaign_summary
WHERE CTR > 0.05
ORDER BY CTR DESC;


-- Checking which campaign type costs the most in terms of acquiring customers.
SELECT Campaign_Type, MAX(Acquisition_Cost) AS Max_Cost
FROM campaign_summary
GROUP BY Campaign_Type;

-- Finding campaigns that engage users well but don’t convert into high ROI.
SELECT Campaign_ID, ROI, Engagement_Score
FROM campaign_summary
WHERE ROI < (SELECT AVG(ROI) FROM campaign_summary) 
  AND Engagement_Score > (SELECT AVG(Engagement_Score) FROM campaign_summary);

-- A high ROI-to-CPC ratio means we’re getting strong returns for every dollar spent per click.
SELECT Campaign_ID, ROUND(ROI / CPC, 2) AS ROI_CPC_Ratio
FROM campaign_summary
WHERE CPC > 0;

-- Helps determine which campaign types generate the most clicks per impression.
SELECT Campaign_Type, AVG(Clicks * 1.0 / Impressions) AS Clicks_to_Impressions_Ratio
FROM campaign_summary
GROUP BY Campaign_Type;

-- Using a CTE to isolate high-ROI campaigns before selecting them.
WITH High_ROI AS (
    SELECT Campaign_ID, Company, ROI
    FROM campaign_summary
    WHERE ROI > (SELECT AVG(ROI) FROM campaign_summary)
)
SELECT * FROM High_ROI;


-- Getting the top 3 ROI campaigns per channel.
WITH RankedCampaigns AS (
    SELECT Campaign_ID, Channel_Used, ROI, 
           ROW_NUMBER() OVER (PARTITION BY Channel_Used ORDER BY ROI DESC) AS Rank
    FROM campaign_summary
)
SELECT Campaign_ID, Channel_Used, ROI, Rank
FROM RankedCampaigns
WHERE Rank <= 3;

-- Campaigns that fall into the bottom 25% of engagement scores.
SELECT Campaign_ID, Company, Engagement_Score
FROM campaign_summary
WHERE Engagement_Score < (
    SELECT DISTINCT TOP 1 
           PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Engagement_Score) OVER ()
    FROM campaign_summary
);

























