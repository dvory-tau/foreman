class general::it_keys {

ssh_authorized_key { 'danny@ccadm':
  ensure => present,
  user   => 'root',
  type   => 'ssh-dss',
  key    => 'AAAAB3NzaC1kc3MAAACBAL5mxSYiYcMrWfBh+BcXa3zsOxXI/vUVuAAycJxzbTTm44EyIitpwfGJpK8XCZEvNxpoC69Ftfg0lL0gpu4xRT7Rt4okRDq+TdRShGcIANamRadpMT6zauyZKa5Fvht4a0+zUOHm83NWo0yq1eMZaOX+yg5rWu37q13Ohs1O/UqjAAAAFQDCEMeo5gLyQVgzOmghMrHQrfn1QQAAAIB1B0l/5gQTZTgheVfl+LTsqhawzfy5C7bEfMmWhxcZVcMpdTvv1WmBQvJFaDsAlbNY+7ntM4GYTs4abChFPMK3+Dbix7wNtIyCaYoWjAnKRYjbNrGlFPY0SUdbDdBK3OPDEisn/zJV3ImP07xKaUZFqmkNIJvCxScnPy+nfwDF4gAAAIEAmy/3zG5tD1GLKS7lI24MWDuPtoAm/4u7c7aTqd8A38ni+QU6yh9Zbql7Ue/42mHgwK74tarQAQdjairlj/mlA6i6vEBLiSc/yu7CxFXck5vv27AqPFjEZH9iAdygFOYR3v0FbCnguRu+FeADeMjjjWZLB9qUyxOHT/HW6StPtoQ=',
}

ssh_authorized_key { 'piniko@ccadm':
  ensure => present,
  user   => 'root',
  type   => 'ssh-dss',
  key	 => 'AAAAB3NzaC1kc3MAAACBAJhoo0A8t9+jEnNVW87JfBXEHHUay14EXeXsmdUfLQR2ZqGuSjxcQ9j5KFp3Wkw9nAQxRwSlPPQRbN24zwrPUggT27nq0NKUwiaS6Zb2cucCKEYXr+I9s+BGj3ekvUkHP+FKrgGM7wtG1lmAhLnNuMpkC3iSIGQIkxsMx9iAYPadAAAAFQDUYu40plmaEl17mdOMbfQzObiU2wAAAIAOtm1o8es2FdFo+/w/A9hRZhnpvbMSzHx5cpDhC+4xX091HHNXo0t2hDman/mCDK+Lx+1pHQV/iTce/po9REKD802LMCvJLoS7sFnPXUDEKQgAzU3Y5WDaHZved/TO6JLs+GOIOVnPmbTqcGFg5sSUSSeQHz1cc8kNYhzEiYjUMwAAAIBVNvZ2J223Cs6vRqr9V2P62hZpCzXkuM2VgO92V1KwGjT7ytT5b06v+27t6Zs7+B6Hrq3TJkheZGC/xXIkdN615ZaHaOJt5fJXrHYv8T2Ajx9PVuuPJqSkvlux3z6V3s7A/mQKAvCZxEG8cFrDVk+IcCUHe1k1+OGjT1Y6lGZ7qA==',
}
ssh_authorized_key { 'piniko2@ccadm':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key    => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA3p5dhAY5dsbmEKY6vmMfntc+9CumpXhGzwSSOOZVXyJpVtzR4vOCACCoix0iBOnjS2zJvwYXqSXt/lXP0z75c2QzJbJPvrO40bgqiBcwB9lL8Q7AmWYKFlKlC5mjFomrdv0h3B0KrD0tkjMBO1dO3lRL+H71UZBUFyafm2GtTJW6oLrTmJpQbmWANdxYTlPn0rTljZatZP7FXuzwt3/EZdmGAPyFYpyeUfB2hdD+WhDboAch35/8NACHhpCVVJIjz/WopSUS2rTBKsPnmYABEyZi+3wFLWMLIDBpgTExZD2BwwzceLOv7hcR3KLiLkmfHY/rDHfFZ6uE/m+JDSAxxw==',
}


ssh_authorized_key { 'dvory@ccadm':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key    => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAqsaXi7+0ZhJsskF0wLMtPTDpj+xsrcBAk9rQvzgngq4GT9YT8+sS+vXmQGtdwfz1l+urxtP6E1dR8Kw768XIPxUTIy7iu3KJhglBp6S5arcF7f13/SWysp2vhFjDgTI9A1i+XD09NMQf9GveDPQ0Pbv4YL5gjKmv2NCTKkUMg8xYoUk6fqnx2uAxYrTmXFy1rFmyKucDnxL17n0kOrLDYKx788Z/yq8lEPfQNYXkKdDHnmO7DdoKN88JiJ00Z80nS/8WUEoqPUV6+TkZk2EBzohWwNQaRhfEM1wHvWWlPWVadqBpGjqt0HFwyZV41oOhz3IjV273c+H0/HuGoLWTzQ==',
}


ssh_authorized_key { 'danny@shir.tau.ac.il':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDFpFsBdCP+o/LvHQoTjEDEHec1qiQB6pJeSvStJwscCfMrYUC/VzeaJkFvcw15cE5oHRXaJMyNmnR7MXtNGHVp0mngu9x6pFpgoSn2ONQz/tNM+GMG8xvqux30A0aKKQxXmmBAa12hed5UInardfXqKQmeHt6TiNbVy8rf8Mx9bps5OPxTTPnLGB4slaLweYwp56t0OsuHd57it36phwb1xoWENbq5JtGOjYmM+6Nhb5wx5i7SbkOtP2GPPnKolngp9j/p+6YAjG7FxLHcyhobXWXv6dK33WkbR8FVP5+A9C8mH/AUChH4vl/RX8mSdFnxsaAYEan0SbqTYio+5Wep',
}

ssh_authorized_key { 'mordkov@ccadm.tau.ac.il':
  ensure => present,
  user   => 'root',
  type   => 'ssh-dss',
  key    => 'AAAAB3NzaC1kc3MAAACBAIc6CaQ/U3P3Wg20cW478HhmDtTzloZGMZqkBe2SIyB9cYccYLaz+j8B50EnuPtYNRvRUbXAZhlTQXLcloT9ZMlqheqwTkASey6DrewcxwlYpMpatMnhnru8qU8j+yeFsIekiUp6vkEWBi0upF1kuIt31CO1nQiS9yEo6A0K1EZtAAAAFQCb+Rd8dJ43sVjR9/UjLaE9e78/JwAAAIAPKcbG/6tscH+QJ9j7pVy5BcoIZBK0WjaqXM0RQQ8siInXKyvoAnIkqCtZnEoQJvoqQGRA7xYtklq89mJgqHub3JH46mi+ih+HRfaQPzcOy3hd2OLuS5UQQX+kSA6USNNkEMBTbpud90ydDB7peXd9uzAS+ae/UAJzF3FgncDceAAAAIAolibnQrk+cwjvsFQUfmuQ2H4J70GayahKZ6pmZStX9RyhLZ2+4+HgtiIsKAe+AlB6wP7kyVR2LccE/iGTQwfMWUREQ28WaFMLJjwOjZrnXb6pMn/EUkHntXGTIIRMWmH8jg0eBTGZ6Z4AoxOBM7T6FCe8jT+yErq3krF1rX1W/A==',
}

}#class
