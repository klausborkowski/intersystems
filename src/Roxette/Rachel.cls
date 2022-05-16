Class Roxette.Rachel Extends %Persistent
{

Property name As %String;

Property id As %String;

Storage Default
{
<Data name="RachelDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>id</Value>
</Value>
</Data>
<DataLocation>^Roxette.RachelD</DataLocation>
<DefaultData>RachelDefaultData</DefaultData>
<ExtentSize>0</ExtentSize>
<IdLocation>^Roxette.RachelD</IdLocation>
<IndexLocation>^Roxette.RachelI</IndexLocation>
<StreamLocation>^Roxette.RachelS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
