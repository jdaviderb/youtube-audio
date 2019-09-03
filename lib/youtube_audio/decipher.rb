# frozen_string_literal: true

module YoutubeAudio
  class Decipher
    # @param cipher [string] youtube signature
    def decipher(cipher)
      decipher = cipher.split('')
      pb(decipher, 35)
      pb(decipher, 30)
      wh(decipher)
      pb(decipher, 2)
      decipher = p7(decipher, 3)
      wh(decipher)
      pb(decipher, 8)
      decipher = p7(decipher, 2)
      decipher.join('')
    end

    def pb(a, b)
      c = a[0]
      a[0] = a[b % a.length]
      a[b % a.length] = c
    end

    def wh(a)
      result = a.reverse!
      result
    end

    def p7(a, b)
      result = a.slice(b, a.length)
      result
    end
  end
end
