root = exports ? window
class root.PasswordStrengthMeter
    constructor:(@password = "") ->
    score:() ->
      score = 0
      # check kind of chars
      for validation in [/\d/,/[a-z]/,/[A-Z]/,/[!@#$%^&*?_~]/]
          score += 20 if validation.test @password
      # check length
      score += 20 if @password.length  >= 8

      return "strong" if score >= 80
      return "normal" if score >= 40
      "week"
