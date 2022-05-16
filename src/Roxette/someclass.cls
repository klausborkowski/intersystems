Class Roxette.someclass Extends %Persistent
{

Property supertrouper As %String;

Storage Default
{
<Data name="someclassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>supertrouper</Value>
</Value>
</Data>
<DataLocation>^Roxette.someclassD</DataLocation>
<DefaultData>someclassDefaultData</DefaultData>
<IdLocation>^Roxette.someclassD</IdLocation>
<IndexLocation>^Roxette.someclassI</IndexLocation>
<StreamLocation>^Roxette.someclassS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
