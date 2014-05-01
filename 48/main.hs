-- so because haskell handles large integers pretty nicely
-- this is pretty trivial
--
-- implementing it in a language without such nice large int handling
-- or if you specifically wanted to avoid big int usage
-- you'd do something like this in c
--
-- selfpow (int n, int dig_lim) {
--   unsigned long mod_val = (unsigned long) pow(10, dig_lim);
--   int ii, jj;
--   unsigned long out = 1;
--
--   for (ii = 2; ii <= n; ++ii) {
--     int this_pow = 1;
--     for (jj = 0; jj < ii; ++jj) {
--       this_pow *= ii;
--       this_pow = this_pow % mod_val;
--     }
--
--     out += this_pow;
--     out = out % mod_val;
--   }
-- }
--
-- because taking the last n digits is equivalent to modulo 10^n arithmatic
-- and (a * b) % c = ((a % c) * (b % c)) % c
-- and (a + b) % c = ((a % c) + (b % c)) % c
--
main = print $ reverse $ take 10 $ reverse $ show $ sum $
         map (\t -> t ^ t) [1..1000]