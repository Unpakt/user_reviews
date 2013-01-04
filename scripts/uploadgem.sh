#!/bin/bash

gem build user_reviews.gemspec

latest_gem_file=`ls -r1 *.gem | head -1`

curl -F p1="@$latest_gem_file" https://gems.gemfury.com/MF3AiwyUX36qby4yxhkn/
