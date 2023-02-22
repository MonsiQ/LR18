type PNode = ^Node; { указатель на узел }
     Node = record
       data: integer;  { полезная }
       next: PNode; { указатель на след. элемент }
     end; 

procedure Push( var Head: PNode; x: integer);
var NewNode: PNode;
begin
  New(NewNode);          { выделение памяти }
  NewNode^.data := x;    { запись символа }
  NewNode^.next := Head; { сделать первым узлом }
  Head := NewNode;
end;

function Pop ( var Head: PNode ): integer;
var q: PNode;
begin
  if Head = nil then begin { если стек пустой } 
    Result := integer(255); { неиспользуемый символ, т.е. ошибка }
    Exit;
  end;
  Result := Head^.data;  { берем верхний символ }
  q := Head;             { запоминаем вершину } 
  Head := Head^.next; { удаляем вершину }
  Dispose(q);            { удаление из памяти }
end;

function isEmptyStack ( S: PNode ): Boolean;
begin
  Result := (S = nil);
end;

var S: PNode;
f,g:text;
i,j:integer;

begin
  S := nil;
  assign(f,'C:\Users\c_class\Downloads\LR18\text.txt');
  reset(f);
  while not eof(f)
  do begin
    read(f,i);
    Push(S,i);
  end;
  close(f);
  assign(g,'C:\Users\c_class\Downloads\LR18\text2.txt');
  rewrite(g);
  while s <> nil do
  begin
    j:=Pop(s);
    writeln(g,j);
  end;
  close(g);
end.