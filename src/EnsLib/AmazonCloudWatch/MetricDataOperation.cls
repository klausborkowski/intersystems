/* Copyright (c) 2022 by InterSystems Corporation.
   Cambridge, Massachusetts, U.S.A.  All rights reserved.
   Confidential property of InterSystems Corporation. */

Class EnsLib.AmazonCloudWatch.MetricDataOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter ADAPTER = "EnsLib.AmazonCloudWatch.OutboundAdapter";

Property Adapter As EnsLib.AmazonCloudWatch.OutboundAdapter;

/// Metric name space
Property Namespace As %String(MAXLEN = 100);

/// Metric name
Property MetricName As %String(MAXLEN = 100);

/// Metric unit.
/// For possible units, please refer to https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/cloudwatch/model/StandardUnit.html
Property MetricUnit As %String(MAXLEN = 100);

/// Metric dimensions. An array of name value pairs in json format.
/// For example, [{"Name":"StorageType","Value":"StandardStorage"},{"Name":"BucketName","Value":"test-fhir"}]
Property Dimensions As %String(MAXLEN = 1000);

Parameter SETTINGS = "Namespace:CloudWatch,MetricName:CloudWatch,MetricUnit:CloudWatch,Dimensions:CloudWatch";

XData MessageMap
{
<MapItems>
  <MapItem MessageType="EnsLib.AmazonCloudWatch.PutMetricDataRequest">
    <Method>PutMetricData</Method>
  </MapItem>
</MapItems>
}

Method PutMetricData(request As EnsLib.AmazonCloudWatch.PutMetricDataRequest, Output response As Ens.Response) As %Status
{
	Set tSC = $$$OK
	Try {
		Set tSC = ..Adapter.PutMetricData(..Namespace, ..MetricName, request.MetricValue, ..MetricUnit, ..Dimensions)
	}
	Catch (ex) {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

}
