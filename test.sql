SELECT EF.*
FROM pana EF
WHERE EF.wid = '400' AND EF.state = 'X' AND 
(
   -- wid 100 で A かつ、200でA　、かつ 500でA
   EXISTS ( 
    SELECT a.sid FROM pana a
    WHERE  a.wid  = '100' AND a.state = 'A'
    AND    EXISTS ( 
            Select b.sid From pana b Where b.sid = a.sid And b.wid = '200' And b.state = 'A')
    AND    EXISTS (
            Select b.sid From pana b Where b.sid = a.sid And b.wid = '500' And b.state = 'A')
    AND    EF.sid = a.sid
   )
   OR
   -- wid 200 で A かつ、600はない、かつ 500でA
   EXISTS (
    SELECT a.sid FROM pana a
    WHERE  a.wid = '200' AND a.state = 'A'
    AND    NOT EXISTS ( 
            Select b.sid From pana b Where b.sid = a.sid And b.wid = '100' )
    AND    EXISTS (
            Select c.sid From pana c Where c.sid = a.sid And c.wid = '500' And c.state = 'A' )
    AND    EF.sid = a.sid
   ) 
)order by sid


