class Log < ApplicationRecord
  enum kind: {
    start: 0,
    end: 1,
    kill: 2
  }
end
