select e1.emp_name,
       d2.dept_name, 
       e3.emp_name as manage, 
       e3.dept_name
from   emp e1 
       left outer join 
       (
        select e2.emp_id, 
               e2.emp_name, 
               d.dep, 
               d.dept_name 
        from   emp e2 left outer join dept d 
        on     e2.dep = d.dep 
       ) e3 
       on e1.manager = e3.EMP_ID 
       left outer join dept d2 
       on e1.DEP = d2.dep

