
local hostname = "xxxx" --hostname of https://github.com/robertklep/nefit-easy-http-server
local port = "3000" --port


local nefit = net.HTTPClient({timeout=2000})

nefit:request("http://"..hostname..":"..port.."/bridge/heatingCircuits/hc1/usermode", {
    options={
        headers = { ["Content-Type"] = "application/json" },
        data = "{\"value\": \"manual\"}",
        method = 'POST',
    },
    success = function(status)

        local result = json.decode(status.data);
        print("status");
        fibaro:debug(json.encode(result));

        if result.status == "ok" then
            print("successful");
        else
            print ("failed");
            print(status.data);
        end
    end,
    error = function(error)
        print "ERROR"
        print(error)
    end
})




