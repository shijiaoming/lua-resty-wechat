local modname = "wechat_cookie"
local _M = { _VERSION = '0.0.1' }
_G[modname] = _M

function _M.get(key)
  -- 获取所有cookie： ngx.var.http_cookie,  这里获取的是一个字符串，如果不存在则返回nil 。
  -- 获取单个cookie： ngx.var.cookie_username, 获取单个cookie，_后面的cookie的name，如果不存在则返回nil 。
  return ngx.var["cookie_" .. key]
end

function _M.set(opt)
  local conf = {
    key = opt and opt.key or nil,
    value = opt and opt.value or nil,
    domain = opt and opt.domain or nil,
    path = opt and opt.path or nil,
    expires = opt and opt.expires or nil
  }
  if not conf.key or not conf.value then return end

  local cookies = ngx.header.Set_Cookie
  if not cookies then cookies = {} end
  if type(cookies) ~= "table" then cookies = {cookies} end

  local cookie = conf.key .. "=" .. conf.value .. ";"
  if conf.domain then cookie = cookie .. " domain=" .. conf.domain .. ";" end
  if conf.path then cookie = cookie .. " path=" .. conf.path .. ";" end
  if conf.expires then cookie = cookie .. " expires=" .. conf.expires .. ";" end

  table.insert(cookies, cookie)
  ngx.header.Set_Cookie = cookies
end

return _M
