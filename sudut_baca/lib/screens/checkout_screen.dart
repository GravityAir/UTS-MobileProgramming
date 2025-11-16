import 'package:flutter/material.dart';
import '../models/book_data.dart';

class CheckoutScreen extends StatefulWidget {
  final Book book;
  const CheckoutScreen({super.key, required this.book});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPaymentMethod = 'Transfer Bank';
  final List<String> _paymentMethods = ['Transfer Bank', 'E-Wallet (OVO/GoPay)', 'COD (Bayar di Tempat)'];

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Konfirmasi Pesanan'),
          content: Text('Pesanan Anda untuk buku "${widget.book.title}" akan segera diproses. Pembayaran melalui $_selectedPaymentMethod. Terima kasih!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pemesanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ringkasan Pesanan', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onBackground)),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(widget.book.imageUrl, width: 50, height: 70, fit: BoxFit.cover),
                  ),
                  title: Text(widget.book.title, style: TextStyle(color: colorScheme.onSurface)),
                  subtitle: Text(
                    'Rp ${widget.book.price.toStringAsFixed(0)}',
                    style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              Text('Data Pengiriman', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onBackground)),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
                style: TextStyle(color: colorScheme.onBackground),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Alamat Pengiriman',
                  prefixIcon: Icon(Icons.home),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
                style: TextStyle(color: colorScheme.onBackground),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon tidak boleh kosong';
                  }
                  return null;
                },
                style: TextStyle(color: colorScheme.onBackground),
              ),
              const SizedBox(height: 32),

              Text('Metode Pembayaran', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onBackground)),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedPaymentMethod,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.payment),
                ),
                dropdownColor: colorScheme.surface,
                items: _paymentMethods.map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method, style: TextStyle(color: colorScheme.onSurface)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPaymentMethod = newValue!;
                  });
                },
                style: TextStyle(color: colorScheme.onBackground),
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: _submitOrder,
                child: const Text('Pesan Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}