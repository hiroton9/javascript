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

--wid 100 で A かつ、200でA　、かつ 500でA
-- もしくは
--wid 200 で A かつ、600はない、かつ 500でAでない
-- 以上の中で
--wid 300 で A かつ、800はない
SELECT AB.sid
FROM   pana AB
WHERE  AB.wid = '300' and AB.state = 'A' 
AND    NOT EXISTS ( SELECT d.sid from pana d where AB.sid = d.sid and d.wid = '800' )
AND   (
      EXISTS (
        select a.sid from pana a where  a.wid = '100' and a.state = 'A'
        and    EXISTS ( select b.sid from pana b where b.sid = a.sid and b.wid = '200' and b.state = 'A' )
        and    EXISTS ( select c.sid from pana c where c.sid = a.sid and c.wid = '500' and c.state = 'A' )
        and AB.sid = a.sid
      )
      OR
      EXISTS (
        select a.sid from pana a where  a.wid = '200' and a.state = 'A'
        and    NOT EXISTS ( select b.sid from pana b where b.sid = a.sid and b.wid = '600' )
        and    EXISTS ( select c.sid from pana c where c.sid = a.sid and c.wid = '500' and c.state != 'A' )
        and AB.sid = a.sid
      )
) 
