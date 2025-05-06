aztec start --node --archiver --sequencer \
  --network alpha-testnet \
  --l1-rpc-urls $RPC  \
  --l1-consensus-host-urls $BEACON \
  --sequencer.validatorPrivateKey $Priv \
  --sequencer.coinbase $Adres \
  --p2p.p2pIp $IP
  --p2p.maxTxPoolSize 1000000000
