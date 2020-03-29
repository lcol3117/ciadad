defmodule MiscMath do
  def abs(x) do
    unless x>0 do
      -x
    else
      x
    end
  end
  def succ(x) do
    x+1
  end
  def prev(x) do
    x-1
  end
  #median of a list
  def median(l) do
    median(Enum.sort(l),:sorted) #wrapper
  end
  def median(l,:sorted) do
    Listops.el(l,div(Listops.ln(l),2))
  end
end

defmodule Listops do
  #mx finds the maximum of a list
  def mx(l) do 
    mx(l,0) #wrapper
  end
  def mx([head|tail],n) do #recursive case
    if head>n do
      mx(tail,head) #new maximum
    else
      mx(tail,n) #keep old maximum
    end
  end
  def mx([],n) do
    n #base case
  end
  #mn finds the minimum of a list
  def mn(l) do
    mn(l,:infinity)
  end
  def mn([head|tail],n) do
    if head<n do
      mn(tail,head) #new minimum
    else
      mn(tail,n) #keep old maximum
    end
  end
  def mn([],n) do
    n #base case
  end
  #el gets an element of a list
  def el([head|_tail],0) do
    head #base case
  end
  def el([_head|tail],n) do
    el(tail,MiscMath.prev(n)) #recursive case
  end
  #ln finds the length of a list
  def ln(l) do
    ln(l,0)
  end
  def ln([_head|tail],n) do
    ln(tail,MiscMath.succ(n)) #recursive case
  end
  def ln([],n) do
    n #base case
  end
  #inv inverts a boolean list
  def inv(l) do
    inv(l,[]) #wrapper
  end
  def inv([head|tail],o) do
    inv(tail,o++[not head]) #recursive case
  end
  def inv([],o) do
    o #base case
  end
end

defmodule CIA3d do
  def dist(a,b) when (is_list(a) and is_list(b)) do
    [d1d,d2d,d3d] = [ldelta(0,a,b),ldelta(1,a,b),ldelta(2,a,b)] #1d distances
    Listops.mx([d1d,d2d,d3d]) #largest distance
  end
  defp ldelta(i,l1,l2) do
    raw=Listops.el(l1,i)-Listops.el(l2,i) #1d delta
    MiscMath.abs(raw) #absolute value
  end
end

defmodule CIADAD do
  def detect(data,:anomalies) do
    detect(data)
  end
  def detect(data,:usual) do
    Listops.inv(detect(data))
  end
  def detect(data) do
    vals=Enum.map(data,fn(x) -> getD(x,data) end)
    thresh=MiscMath.median(vals) #median of vals
    Enum.map(vals,fn(x) -> x > thresh end)
  end
  def getD(i,data) do
    options=Enum.map(data,fn(x) -> distNotSelf(i,x) end)
    Listops.mn(options)
  end
  def distNotSelf(a,b) do
    raw=CIA3d.dist(a,b)
    unless raw===0 do
      raw
    else
      :infinity
    end
  end
end

mydata=[[3,3,1],[2,3,1],[3,2,1],[4,3,1],[2,2,1],[5,5,1],[5,6,1],[6,5,1],[10,1,1]]
IO.inspect(CIADAD.detect(mydata,:usual))
