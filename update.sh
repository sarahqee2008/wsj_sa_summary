#!/bin/bash
set -e

echo "Starting daily news update at $(date -u)"

claude -p --allowedTools 'WebSearch,WebFetch,Read,Write,Edit' "
You are updating a daily financial news dashboard. The file is index.html in the current directory.

YOUR TASK:
1. Search the web for today's top MarketWatch, Barron's, and Seeking Alpha news/analysis articles
2. Search for current market data: Dow, S&P 500, NASDAQ, Russell 2000, WTI oil, gold, silver, copper prices
3. Read the existing index.html to understand the exact HTML structure and styling
4. Update index.html with:
   - Fresh market data in the Market Overview grid (8 cards: Dow, S&P 500, NASDAQ, Russell 2000, WTI Oil, Gold, Silver, Copper)
   - New articles organized into segments: 市场动态, 财报季, 股票精选, 宏观经济, 人工智能, 大宗商品, 加密货币, 企业动态
   - Each article needs: English title, Chinese summary (2-3 sentences), source tag (MarketWatch/Barron's/SA), date, and link to original article
   - Update the date in the header date-badge and footer
   - Keep the EXACT same HTML structure, CSS, and JavaScript (segment filter tabs)
   - Use the news-grid (2-column grid) layout within each segment
   - Aim for 16-21 total articles across all segments
   - Source tags should use: source-mw for MarketWatch, source-bar for Barron's, source-sa for Seeking Alpha

IMPORTANT:
- Keep all existing CSS and JS code unchanged
- Only update the content inside the market-grid and segment-sections
- Update the date-badge and footer update time
- Every news card must link to a real article URL (target=_blank)
- Write Chinese summaries that are concise and informative
- Keep the refresh-info section at the bottom unchanged
- Sources are: MarketWatch, Barron's, and Seeking Alpha (NOT WSJ)
"

echo "Update complete at $(date -u)"
