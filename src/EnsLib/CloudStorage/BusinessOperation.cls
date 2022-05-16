/* Copyright (c) 2022 by InterSystems Corporation.
   Cambridge, Massachusetts, U.S.A.  All rights reserved.
   Confidential property of InterSystems Corporation. */

Class EnsLib.CloudStorage.BusinessOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter ADAPTER = "EnsLib.CloudStorage.OutboundAdapter";

Property Adapter As EnsLib.CloudStorage.OutboundAdapter;

/// Bucket name
Property BucketName As %String(MAXLEN = 1000);

Parameter SETTINGS = "BucketName:Cloud Storage";

XData MessageMap
{
<MapItems>
  <MapItem MessageType="EnsLib.CloudStorage.UploadRequest">
    <Method>Upload</Method>
  </MapItem>
  <MapItem MessageType="EnsLib.CloudStorage.DeleteRequest">
    <Method>Delete</Method>
  </MapItem>
</MapItems>
}

Method Upload(request As EnsLib.CloudStorage.UploadRequest, Output response As Ens.Response) As %Status
{
	Set tSC = $$$OK
	Try {
		Set tSC = ..Adapter.UploadBlobFromStream(..BucketName, request.BlobName, request.Content)
	}
	Catch (ex) {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

Method Delete(request As EnsLib.CloudStorage.DeleteRequest, Output response As Ens.Response) As %Status
{
	Set tSC = $$$OK
	Try {
		Set tSC = ..Adapter.DeleteBlob(..BucketName, request.BlobName)
	}
	Catch (ex) {
		Set tSC = ex.AsStatus()
	}
	Quit tSC
}

}
