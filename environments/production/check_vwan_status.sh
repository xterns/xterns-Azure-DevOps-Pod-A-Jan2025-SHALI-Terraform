#!/bin/bash

RESOURCE_GROUP="xterns-pod"
VIRTUAL_HUB_NAME="xterns-Azure-PodA-Jan2025-virtualwan-hub"

echo "🔍 Checking Virtual Hub status..."
az network vhub show \
  --name "$VIRTUAL_HUB_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --query "{name:name, location:location, provisioningState:provisioningState}" \
  --output table

echo ""
echo "🔗 Checking VNet Connections to Virtual Hub..."
az network vhub connection list \
  --vhub-name "$VIRTUAL_HUB_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --query "[].{Name:name, VNetId:remoteVirtualNetwork.id, Status:provisioningState}" \
  --output table
