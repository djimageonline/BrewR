require "http"

response = HTTP.get(“http://beermapping.com/webservice/locquery/afdeac53a3e38ffb25babbaa862d1de7/”)
data = JSON.parse(response.body)

puts data