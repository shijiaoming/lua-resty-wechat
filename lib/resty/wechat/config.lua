local modname = "wechat_config"
local _M = { _VERSION = '0.0.2' }
_G[modname] = _M

_M.appid = "wx7e024400b914f1be" -- 公众平台AppID
_M.appsecret = "b0520c1c20aaf8abd12ebd4d586e7bc5" -- 公众平台AppSecret

_M.token = "" -- 公众平台接口配置Token

---------- Optional ----------

-- _M.autoreply = { -- 简单的自动回复设置
  -- text     = {
  --   { cond = { content = "用户发出的文字消息全文匹配的正则表达式" },
  --     resp = { msgtype = "text或其他消息类型", 以及对应消息所需的字段和内容 },
  --     continue = true/false -- 消息是否透传到autoreplyurl
  --   },
  -- },
  -- image    = { },
  -- voice    = { },
  -- video    = { },
  -- location = { },
  -- link     = { },
  -- event    = {
  --   { cond = { event = "CLICK或其他事件类型", 以及事件标识的全文匹配正则表达式 },
  --     resp = { msgtype = "text或其他消息类型", 以及对应消息所需的字段和内容 }
  --   },
  -- },
-- }

-- _M.autoreplyurl = "" -- 转发消息到指定URL, 对应服务可返回消息内容的JSON, 或直接返回success

 _M.redis = { -- redis配置
   host = "172.21.32.17",
   port = 7100,
   timeout = 5000,
   maxIdleTimeout = 10000,
   poolSize = 10,
   distributedLockTimeout = 10,
   password = "R7psDis81Mz",
   database = 0
 }

 _M.accessTokenUpdateTime = 6000 -- AccessToken更新时间
 _M.accessTokenPollingTime = 600 -- AccessToken更新轮询时间
 _M.accessTokenKey = _M.appid -- AccessToken存储在redis的key
 _M.jsapiTicketKey = _M.appid .. "_ticket" -- jsapi_ticket存储在redis的key

-- _M.permitClientIPs = { "127.0.0.1" } -- 允许访问的客户端IP列表

 _M.base_oauth_key = "__rywy_base"          -- 网页授权跳转后保存用户基本信息的cookie的key
 _M.userinfo_oauth_key = "__rywy_userinfo"  -- 网页授权跳转后保存用户完整信息的cookie的key
 _M.cookie_domain = "topsales.net.cn"       -- 网页授权跳转后保存用户信息的cookie的domain
 _M.cookie_path = "/"                       -- 网页授权跳转后保存用户信息的cookie的path
 _M.cookie_aes_key = "vFrItmxI9ct8JbAg"     -- 网页授权跳转后保存用户信息的cookie的AES密钥

return _M
