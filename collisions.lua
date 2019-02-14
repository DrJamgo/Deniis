-- This module redirects all collision calls to the userData of the fixture

function checkAndCall(fixture, func, ...)
  local userData = fixture:getUserData()
  if userData then
    if userData[func] then
      userData[func](userData, fixture, ...)
    end
  end
end

function beginContact(a, b, coll)
  checkAndCall(a, "beginContact", b, coll)
  checkAndCall(b, "beginContact", a, coll)
end
 
function endContact(a, b, coll)
  checkAndCall(a, "endContact", b, coll)
  checkAndCall(b, "endContact", a, coll)
end
 
function preSolve(a, b, coll)
  checkAndCall(a, "preSolve", b, coll)
  checkAndCall(b, "preSolve", a, coll)
end
 
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
  checkAndCall(a, "postSolve", b, coll, normalimpulse, tangentimpulse)
  checkAndCall(b, "postSolve", a, coll, normalimpulse, tangentimpulse)
end