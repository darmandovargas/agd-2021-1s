1. SELECT a.ano, l.rango_edad, COUNT(l.rango_edad) as cantidad  FROM accidente AS a 
INNER JOIN lesionado AS l ON l.id = a.id_lesionado
WHERE a.ano = 2017 GROUP BY l.rango_edad;

2. SELECT a.ano, l.rango_edad, COUNT(l.rango_edad) as cantidad  FROM accidente AS a 
INNER JOIN lesionado AS l ON l.id = a.id_lesionado
GROUP BY a.ano, l.rango_edad;

3. SELECT a.ano, COUNT(a.id_accidente)/365 as promedio_por_dia FROM accidente AS a
GROUP BY a.ano;

4. SELECT a.ano, l.rango_edad, v.name, COUNT(l.rango_edad) as cantidad  FROM accidente AS a 
INNER JOIN lesionado as l ON l.id = a.id_lesionado
INNER JOIN vehiculo AS v ON v.id_tipo_de_vehiculo = a.id_vehiculo
GROUP BY a.ano, l.rango_edad;

5. SELECT a.ano, l.rango_edad, oc.nombre, COUNT(l.rango_edad) as cantidad  FROM accidente AS a 
INNER JOIN lesionado as l ON l.id = a.id_lesionado
INNER JOIN objeto_colision AS oc ON oc.id = a.id_objeto_colision
GROUP BY a.ano, l.rango_edad;