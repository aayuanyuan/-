1)查询所有没有使用武器的武功的基本信息
SELECT *
FROM KungFu
WHERE kWeapon='无';

2)查询“大理段氏”所开设的全部武功
SELECT kName
FROM KungFu JOIN department USING(dID)
WHERE dName='大理段氏';

3)查询门派“丐帮”的所在地
SELECT dAdd
FROM department
WHERE dName='丐帮';

4)统计“桃花岛”所开设的武功门数
SELECT COUNT(kName)
FROM KungFu JOIN department USING(dID)
WHERE dName='桃花岛';

5)创建视图用于查询门派所开设的武功，列出门派名称，武功名称，武功杀伤力
CREATE VIEW view_K
AS
SELECT dName,kName,kPower
FROM KungFu JOIN department USING(dID);

SELECT *
FROM view_K;

6)创建存储过程，查询指定门派所开设的武功
CREATE PROCEDURE spGetKung(IN name VARCHAR(15))
BEGIN
   SELECT kName
   FROM KungFu JOIN department USING(dID)
   WHERE dName=name;
END

CALL spGetKung('丐帮');

DROP PROCEDURE spGetKung;

