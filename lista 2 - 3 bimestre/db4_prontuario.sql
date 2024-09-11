USE db_prontuario_exam;

/*4)Crie uma consulta que recupere todos os prontuários, incluindo o nome do
paciente e o nome do médico que o atendeu. Utilize INNER JOIN entre as
tabelas de prontuários e pacientes.
*/

SELECT prontuarios.*, pacientes.nome
FROM prontuarios INNER JOIN pacientes
ON prontuarios.paciente_id= pacientes.paciente_id;

/*2) Elabore uma consulta para listar todos os pacientes e suas consultas,
incluindo pacientes que não têm consultas registradas. Utilize LEFT JOIN
entre as tabelas de pacientes e consultas.
*/

SELECT pacientes.*, consultas.*
FROM pacientes LEFT JOIN consultas 
ON pacientes.paciente_id = consultas.paciente_id;