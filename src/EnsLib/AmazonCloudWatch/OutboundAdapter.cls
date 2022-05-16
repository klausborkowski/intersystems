/* Copyright (c) 2022 by InterSystems Corporation.
   Cambridge, Massachusetts, U.S.A.  All rights reserved.
   Confidential property of InterSystems Corporation. */

Class EnsLib.AmazonCloudWatch.OutboundAdapter Extends (EnsLib.PEX.OutboundAdapter, EnsLib.Amazon.Common) [ ClassType = "", Inheritance = right, ProcedureBlock, System = 4 ]
{

Method OnInit() As %Status
{
	Set ..%remoteClassname = "com.intersystems.cloud.amazonCW.OutboundAdapter"
	Set ..%gatewayName = "%Java Server"
	Set ..%gatewayExtraClasspaths = ..GetCloudClientJARPaths()
	Quit ##super()
}

Method PutMetricData(namespace As %String, metricName As %String, metricValue As %Numeric, metricUnit As %String, dims As %String = "") As %Status
{
	Set tSC = $$$OK
	Try {
		Do ..%gatewayProxy.putMetricData(namespace, metricName, metricValue, metricUnit, dims)
	}
	Catch (ex) {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

Method PutMetricAlarm() As %Status
{
	Set tSC = $$$OK
	Try {
		Do ..%gatewayProxy.putMetricAlarm()
	}
	Catch (ex) {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

}
