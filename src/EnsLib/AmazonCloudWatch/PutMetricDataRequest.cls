/* Copyright (c) 2022 by InterSystems Corporation.
   Cambridge, Massachusetts, U.S.A.  All rights reserved.
   Confidential property of InterSystems Corporation. */

Class EnsLib.AmazonCloudWatch.PutMetricDataRequest Extends Ens.Request
{

Property MetricValue As %Numeric;

Storage Default
{
<Data name="PutMetricDataRequestDefaultData">
<Subscript>"PutMetricDataRequest"</Subscript>
<Value name="1">
<Value>MetricValue</Value>
</Value>
</Data>
<DefaultData>PutMetricDataRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
