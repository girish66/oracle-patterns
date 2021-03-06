drop table tq84_cursor;
create table tq84_cursor (
  a number,
  b varchar2(10)
);

insert into tq84_cursor values (1, 'one'  );
insert into tq84_cursor values (2, 'two'  );
insert into tq84_cursor values (3, 'three');
insert into tq84_cursor values (4, 'four' );

declare

  cursor cur(a_ number) is
    select * from tq84_cursor
     where a > a_;

  rec cur%rowtype;

begin

  open cur(1);

  fetch cur into rec;
  while cur%found loop

    dbms_output.put_line('a: ' || rec.a || ', b: ' || rec.b);
    fetch cur into rec;

  end loop;

  close cur;

end;
/

