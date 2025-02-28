//
//  QueryRoot.swift
//  Buy
//
//  Created by Shopify.
//  Copyright (c) 2017 Shopify Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension Storefront {
	/// The schema’s entry-point for queries. This acts as the public, top-level 
	/// API from which all queries must start. 
	open class QueryRootQuery: GraphQL.AbstractQuery, GraphQLQuery {
		public typealias Response = QueryRoot

		open override var description: String {
			return "query " + super.description
		}

		/// List of the shop's articles. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///     - after: Returns the elements that come after the specified cursor.
		///     - last: Returns up to the last `n` elements from the list.
		///     - before: Returns the elements that come before the specified cursor.
		///     - reverse: Reverse the order of the underlying list.
		///     - sortKey: Sort the underlying list by the given key.
		///     - query: Supported filter parameters:
		///         - `author`
		///         - `blog_title`
		///         - `created_at`
		///         - `tag`
		///         - `tag_not`
		///         - `updated_at`
		///        
		///        See the detailed [search syntax](https://shopify.dev/api/usage/search-syntax)
		///        for more information about using filters.
		///
		@discardableResult
		open func articles(alias: String? = nil, first: Int32? = nil, after: String? = nil, last: Int32? = nil, before: String? = nil, reverse: Bool? = nil, sortKey: ArticleSortKeys? = nil, query: String? = nil, _ subfields: (ArticleConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let first = first {
				args.append("first:\(first)")
			}

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let last = last {
				args.append("last:\(last)")
			}

			if let before = before {
				args.append("before:\(GraphQL.quoteString(input: before))")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let query = query {
				args.append("query:\(GraphQL.quoteString(input: query))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = ArticleConnectionQuery()
			subfields(subquery)

			addField(field: "articles", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Fetch a specific `Blog` by one of its unique attributes. 
		///
		/// - parameters:
		///     - id: The ID of the `Blog`.
		///     - handle: The handle of the `Blog`.
		///
		@discardableResult
		open func blog(alias: String? = nil, id: GraphQL.ID? = nil, handle: String? = nil, _ subfields: (BlogQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let id = id {
				args.append("id:\(GraphQL.quoteString(input: "\(id.rawValue)"))")
			}

			if let handle = handle {
				args.append("handle:\(GraphQL.quoteString(input: handle))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = BlogQuery()
			subfields(subquery)

			addField(field: "blog", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Find a blog by its handle. 
		///
		/// - parameters:
		///     - handle: The handle of the blog.
		///
		@available(*, deprecated, message:"Use `blog` instead")
		@discardableResult
		open func blogByHandle(alias: String? = nil, handle: String, _ subfields: (BlogQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("handle:\(GraphQL.quoteString(input: handle))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = BlogQuery()
			subfields(subquery)

			addField(field: "blogByHandle", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// List of the shop's blogs. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///     - after: Returns the elements that come after the specified cursor.
		///     - last: Returns up to the last `n` elements from the list.
		///     - before: Returns the elements that come before the specified cursor.
		///     - reverse: Reverse the order of the underlying list.
		///     - sortKey: Sort the underlying list by the given key.
		///     - query: Supported filter parameters:
		///         - `created_at`
		///         - `handle`
		///         - `title`
		///         - `updated_at`
		///        
		///        See the detailed [search syntax](https://shopify.dev/api/usage/search-syntax)
		///        for more information about using filters.
		///
		@discardableResult
		open func blogs(alias: String? = nil, first: Int32? = nil, after: String? = nil, last: Int32? = nil, before: String? = nil, reverse: Bool? = nil, sortKey: BlogSortKeys? = nil, query: String? = nil, _ subfields: (BlogConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let first = first {
				args.append("first:\(first)")
			}

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let last = last {
				args.append("last:\(last)")
			}

			if let before = before {
				args.append("before:\(GraphQL.quoteString(input: before))")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let query = query {
				args.append("query:\(GraphQL.quoteString(input: query))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = BlogConnectionQuery()
			subfields(subquery)

			addField(field: "blogs", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Find a cart by its ID. 
		///
		/// - parameters:
		///     - id: The id of the cart.
		///
		@discardableResult
		open func cart(alias: String? = nil, id: GraphQL.ID, _ subfields: (CartQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("id:\(GraphQL.quoteString(input: "\(id.rawValue)"))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = CartQuery()
			subfields(subquery)

			addField(field: "cart", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Fetch a specific `Collection` by one of its unique attributes. 
		///
		/// - parameters:
		///     - id: The ID of the `Collection`.
		///     - handle: The handle of the `Collection`.
		///
		@discardableResult
		open func collection(alias: String? = nil, id: GraphQL.ID? = nil, handle: String? = nil, _ subfields: (CollectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let id = id {
				args.append("id:\(GraphQL.quoteString(input: "\(id.rawValue)"))")
			}

			if let handle = handle {
				args.append("handle:\(GraphQL.quoteString(input: handle))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = CollectionQuery()
			subfields(subquery)

			addField(field: "collection", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Find a collection by its handle. 
		///
		/// - parameters:
		///     - handle: The handle of the collection.
		///
		@available(*, deprecated, message:"Use `collection` instead")
		@discardableResult
		open func collectionByHandle(alias: String? = nil, handle: String, _ subfields: (CollectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("handle:\(GraphQL.quoteString(input: handle))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = CollectionQuery()
			subfields(subquery)

			addField(field: "collectionByHandle", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// List of the shop’s collections. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///     - after: Returns the elements that come after the specified cursor.
		///     - last: Returns up to the last `n` elements from the list.
		///     - before: Returns the elements that come before the specified cursor.
		///     - reverse: Reverse the order of the underlying list.
		///     - sortKey: Sort the underlying list by the given key.
		///     - query: Supported filter parameters:
		///         - `collection_type`
		///         - `title`
		///         - `updated_at`
		///        
		///        See the detailed [search syntax](https://shopify.dev/api/usage/search-syntax)
		///        for more information about using filters.
		///
		@discardableResult
		open func collections(alias: String? = nil, first: Int32? = nil, after: String? = nil, last: Int32? = nil, before: String? = nil, reverse: Bool? = nil, sortKey: CollectionSortKeys? = nil, query: String? = nil, _ subfields: (CollectionConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let first = first {
				args.append("first:\(first)")
			}

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let last = last {
				args.append("last:\(last)")
			}

			if let before = before {
				args.append("before:\(GraphQL.quoteString(input: before))")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let query = query {
				args.append("query:\(GraphQL.quoteString(input: query))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = CollectionConnectionQuery()
			subfields(subquery)

			addField(field: "collections", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Find a customer by its access token. 
		///
		/// - parameters:
		///     - customerAccessToken: The customer access token.
		///
		@discardableResult
		open func customer(alias: String? = nil, customerAccessToken: String, _ subfields: (CustomerQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("customerAccessToken:\(GraphQL.quoteString(input: customerAccessToken))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = CustomerQuery()
			subfields(subquery)

			addField(field: "customer", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Returns the localized experiences configured for the shop. 
		@discardableResult
		open func localization(alias: String? = nil, _ subfields: (LocalizationQuery) -> Void) -> QueryRootQuery {
			let subquery = LocalizationQuery()
			subfields(subquery)

			addField(field: "localization", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// List of the shop's locations that support in-store pickup. When sorting by 
		/// distance, you must specify a location via the `near` argument. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///     - after: Returns the elements that come after the specified cursor.
		///     - last: Returns up to the last `n` elements from the list.
		///     - before: Returns the elements that come before the specified cursor.
		///     - reverse: Reverse the order of the underlying list.
		///     - sortKey: Sort the underlying list by the given key.
		///     - near: Used to sort results based on proximity to the provided location.
		///
		@discardableResult
		open func locations(alias: String? = nil, first: Int32? = nil, after: String? = nil, last: Int32? = nil, before: String? = nil, reverse: Bool? = nil, sortKey: LocationSortKeys? = nil, near: GeoCoordinateInput? = nil, _ subfields: (LocationConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let first = first {
				args.append("first:\(first)")
			}

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let last = last {
				args.append("last:\(last)")
			}

			if let before = before {
				args.append("before:\(GraphQL.quoteString(input: before))")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let near = near {
				args.append("near:\(near.serialize())")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = LocationConnectionQuery()
			subfields(subquery)

			addField(field: "locations", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// A storefront menu. 
		///
		/// - parameters:
		///     - handle: Returns a storefront menu by the specified handle.
		///
		@discardableResult
		open func menu(alias: String? = nil, handle: String, _ subfields: (MenuQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("handle:\(GraphQL.quoteString(input: handle))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = MenuQuery()
			subfields(subquery)

			addField(field: "menu", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Returns a specific node by ID. 
		///
		/// - parameters:
		///     - id: The ID of the Node to return.
		///
		@discardableResult
		open func node(alias: String? = nil, id: GraphQL.ID, _ subfields: (NodeQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("id:\(GraphQL.quoteString(input: "\(id.rawValue)"))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = NodeQuery()
			subfields(subquery)

			addField(field: "node", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Returns the list of nodes with the given IDs. 
		///
		/// - parameters:
		///     - ids: The IDs of the Nodes to return.
		///
		@discardableResult
		open func nodes(alias: String? = nil, ids: [GraphQL.ID], _ subfields: (NodeQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("ids:[\(ids.map{ "\(GraphQL.quoteString(input: "\($0.rawValue)"))" }.joined(separator: ","))]")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = NodeQuery()
			subfields(subquery)

			addField(field: "nodes", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Fetch a specific `Page` by one of its unique attributes. 
		///
		/// - parameters:
		///     - id: The ID of the `Page`.
		///     - handle: The handle of the `Page`.
		///
		@discardableResult
		open func page(alias: String? = nil, id: GraphQL.ID? = nil, handle: String? = nil, _ subfields: (PageQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let id = id {
				args.append("id:\(GraphQL.quoteString(input: "\(id.rawValue)"))")
			}

			if let handle = handle {
				args.append("handle:\(GraphQL.quoteString(input: handle))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = PageQuery()
			subfields(subquery)

			addField(field: "page", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Find a page by its handle. 
		///
		/// - parameters:
		///     - handle: The handle of the page.
		///
		@available(*, deprecated, message:"Use `page` instead")
		@discardableResult
		open func pageByHandle(alias: String? = nil, handle: String, _ subfields: (PageQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("handle:\(GraphQL.quoteString(input: handle))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = PageQuery()
			subfields(subquery)

			addField(field: "pageByHandle", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// List of the shop's pages. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///     - after: Returns the elements that come after the specified cursor.
		///     - last: Returns up to the last `n` elements from the list.
		///     - before: Returns the elements that come before the specified cursor.
		///     - reverse: Reverse the order of the underlying list.
		///     - sortKey: Sort the underlying list by the given key.
		///     - query: Supported filter parameters:
		///         - `created_at`
		///         - `handle`
		///         - `title`
		///         - `updated_at`
		///        
		///        See the detailed [search syntax](https://shopify.dev/api/usage/search-syntax)
		///        for more information about using filters.
		///
		@discardableResult
		open func pages(alias: String? = nil, first: Int32? = nil, after: String? = nil, last: Int32? = nil, before: String? = nil, reverse: Bool? = nil, sortKey: PageSortKeys? = nil, query: String? = nil, _ subfields: (PageConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let first = first {
				args.append("first:\(first)")
			}

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let last = last {
				args.append("last:\(last)")
			}

			if let before = before {
				args.append("before:\(GraphQL.quoteString(input: before))")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let query = query {
				args.append("query:\(GraphQL.quoteString(input: query))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = PageConnectionQuery()
			subfields(subquery)

			addField(field: "pages", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Fetch a specific `Product` by one of its unique attributes. 
		///
		/// - parameters:
		///     - id: The ID of the `Product`.
		///     - handle: The handle of the `Product`.
		///
		@discardableResult
		open func product(alias: String? = nil, id: GraphQL.ID? = nil, handle: String? = nil, _ subfields: (ProductQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let id = id {
				args.append("id:\(GraphQL.quoteString(input: "\(id.rawValue)"))")
			}

			if let handle = handle {
				args.append("handle:\(GraphQL.quoteString(input: handle))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = ProductQuery()
			subfields(subquery)

			addField(field: "product", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Find a product by its handle. 
		///
		/// - parameters:
		///     - handle: The handle of the product.
		///
		@available(*, deprecated, message:"Use `product` instead")
		@discardableResult
		open func productByHandle(alias: String? = nil, handle: String, _ subfields: (ProductQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("handle:\(GraphQL.quoteString(input: handle))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = ProductQuery()
			subfields(subquery)

			addField(field: "productByHandle", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Find recommended products related to a given `product_id`. To learn more 
		/// about how recommendations are generated, see [*Showing product 
		/// recommendations on product 
		/// pages*](https://help.shopify.com/themes/development/recommended-products). 
		///
		/// - parameters:
		///     - productId: The id of the product.
		///
		@discardableResult
		open func productRecommendations(alias: String? = nil, productId: GraphQL.ID, _ subfields: (ProductQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("productId:\(GraphQL.quoteString(input: "\(productId.rawValue)"))")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = ProductQuery()
			subfields(subquery)

			addField(field: "productRecommendations", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// Tags added to products. Additional access scope required: 
		/// unauthenticated_read_product_tags. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///
		@discardableResult
		open func productTags(alias: String? = nil, first: Int32, _ subfields: (StringConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("first:\(first)")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = StringConnectionQuery()
			subfields(subquery)

			addField(field: "productTags", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// List of product types for the shop's products that are published to your 
		/// app. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///
		@discardableResult
		open func productTypes(alias: String? = nil, first: Int32, _ subfields: (StringConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			args.append("first:\(first)")

			let argsString = "(\(args.joined(separator: ",")))"

			let subquery = StringConnectionQuery()
			subfields(subquery)

			addField(field: "productTypes", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// List of the shop’s products. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///     - after: Returns the elements that come after the specified cursor.
		///     - last: Returns up to the last `n` elements from the list.
		///     - before: Returns the elements that come before the specified cursor.
		///     - reverse: Reverse the order of the underlying list.
		///     - sortKey: Sort the underlying list by the given key.
		///     - query: Supported filter parameters:
		///         - `available_for_sale`
		///         - `created_at`
		///         - `product_type`
		///         - `tag`
		///         - `tag_not`
		///         - `title`
		///         - `updated_at`
		///         - `variants.price`
		///         - `vendor`
		///        
		///        See the detailed [search syntax](https://shopify.dev/api/usage/search-syntax)
		///        for more information about using filters.
		///
		@discardableResult
		open func products(alias: String? = nil, first: Int32? = nil, after: String? = nil, last: Int32? = nil, before: String? = nil, reverse: Bool? = nil, sortKey: ProductSortKeys? = nil, query: String? = nil, _ subfields: (ProductConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let first = first {
				args.append("first:\(first)")
			}

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let last = last {
				args.append("last:\(last)")
			}

			if let before = before {
				args.append("before:\(GraphQL.quoteString(input: before))")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			if let sortKey = sortKey {
				args.append("sortKey:\(sortKey.rawValue)")
			}

			if let query = query {
				args.append("query:\(GraphQL.quoteString(input: query))")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = ProductConnectionQuery()
			subfields(subquery)

			addField(field: "products", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}

		/// The list of public Storefront API versions, including supported, release 
		/// candidate and unstable versions. 
		@discardableResult
		open func publicApiVersions(alias: String? = nil, _ subfields: (ApiVersionQuery) -> Void) -> QueryRootQuery {
			let subquery = ApiVersionQuery()
			subfields(subquery)

			addField(field: "publicApiVersions", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// The shop associated with the storefront access token. 
		@discardableResult
		open func shop(alias: String? = nil, _ subfields: (ShopQuery) -> Void) -> QueryRootQuery {
			let subquery = ShopQuery()
			subfields(subquery)

			addField(field: "shop", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// A list of redirects for a shop. 
		///
		/// - parameters:
		///     - first: Returns up to the first `n` elements from the list.
		///     - after: Returns the elements that come after the specified cursor.
		///     - last: Returns up to the last `n` elements from the list.
		///     - before: Returns the elements that come before the specified cursor.
		///     - reverse: Reverse the order of the underlying list.
		///
		@discardableResult
		open func urlRedirects(alias: String? = nil, first: Int32? = nil, after: String? = nil, last: Int32? = nil, before: String? = nil, reverse: Bool? = nil, _ subfields: (UrlRedirectConnectionQuery) -> Void) -> QueryRootQuery {
			var args: [String] = []

			if let first = first {
				args.append("first:\(first)")
			}

			if let after = after {
				args.append("after:\(GraphQL.quoteString(input: after))")
			}

			if let last = last {
				args.append("last:\(last)")
			}

			if let before = before {
				args.append("before:\(GraphQL.quoteString(input: before))")
			}

			if let reverse = reverse {
				args.append("reverse:\(reverse)")
			}

			let argsString: String? = args.isEmpty ? nil : "(\(args.joined(separator: ",")))"

			let subquery = UrlRedirectConnectionQuery()
			subfields(subquery)

			addField(field: "urlRedirects", aliasSuffix: alias, args: argsString, subfields: subquery)
			return self
		}
	}

	/// The schema’s entry-point for queries. This acts as the public, top-level 
	/// API from which all queries must start. 
	open class QueryRoot: GraphQL.AbstractResponse, GraphQLObject {
		public typealias Query = QueryRootQuery

		internal override func deserializeValue(fieldName: String, value: Any) throws -> Any? {
			let fieldValue = value
			switch fieldName {
				case "articles":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try ArticleConnection(fields: value)

				case "blog":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Blog(fields: value)

				case "blogByHandle":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Blog(fields: value)

				case "blogs":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try BlogConnection(fields: value)

				case "cart":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Cart(fields: value)

				case "collection":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Collection(fields: value)

				case "collectionByHandle":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Collection(fields: value)

				case "collections":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try CollectionConnection(fields: value)

				case "customer":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Customer(fields: value)

				case "localization":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Localization(fields: value)

				case "locations":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try LocationConnection(fields: value)

				case "menu":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Menu(fields: value)

				case "node":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try UnknownNode.create(fields: value)

				case "nodes":
				guard let value = value as? [Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try value.map { if $0 is NSNull { return nil }
				guard let value = $0 as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try UnknownNode.create(fields: value) } as [Any?]

				case "page":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Page(fields: value)

				case "pageByHandle":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Page(fields: value)

				case "pages":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try PageConnection(fields: value)

				case "product":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Product(fields: value)

				case "productByHandle":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Product(fields: value)

				case "productRecommendations":
				if value is NSNull { return nil }
				guard let value = value as? [[String: Any]] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try value.map { return try Product(fields: $0) }

				case "productTags":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try StringConnection(fields: value)

				case "productTypes":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try StringConnection(fields: value)

				case "products":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try ProductConnection(fields: value)

				case "publicApiVersions":
				guard let value = value as? [[String: Any]] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try value.map { return try ApiVersion(fields: $0) }

				case "shop":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try Shop(fields: value)

				case "urlRedirects":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
				}
				return try UrlRedirectConnection(fields: value)

				default:
				throw SchemaViolationError(type: QueryRoot.self, field: fieldName, value: fieldValue)
			}
		}

		/// List of the shop's articles. 
		open var articles: Storefront.ArticleConnection {
			return internalGetArticles()
		}

		open func aliasedArticles(alias: String) -> Storefront.ArticleConnection {
			return internalGetArticles(alias: alias)
		}

		func internalGetArticles(alias: String? = nil) -> Storefront.ArticleConnection {
			return field(field: "articles", aliasSuffix: alias) as! Storefront.ArticleConnection
		}

		/// Fetch a specific `Blog` by one of its unique attributes. 
		open var blog: Storefront.Blog? {
			return internalGetBlog()
		}

		open func aliasedBlog(alias: String) -> Storefront.Blog? {
			return internalGetBlog(alias: alias)
		}

		func internalGetBlog(alias: String? = nil) -> Storefront.Blog? {
			return field(field: "blog", aliasSuffix: alias) as! Storefront.Blog?
		}

		/// Find a blog by its handle. 
		@available(*, deprecated, message:"Use `blog` instead")
		open var blogByHandle: Storefront.Blog? {
			return internalGetBlogByHandle()
		}

		@available(*, deprecated, message:"Use `blog` instead")

		open func aliasedBlogByHandle(alias: String) -> Storefront.Blog? {
			return internalGetBlogByHandle(alias: alias)
		}

		func internalGetBlogByHandle(alias: String? = nil) -> Storefront.Blog? {
			return field(field: "blogByHandle", aliasSuffix: alias) as! Storefront.Blog?
		}

		/// List of the shop's blogs. 
		open var blogs: Storefront.BlogConnection {
			return internalGetBlogs()
		}

		open func aliasedBlogs(alias: String) -> Storefront.BlogConnection {
			return internalGetBlogs(alias: alias)
		}

		func internalGetBlogs(alias: String? = nil) -> Storefront.BlogConnection {
			return field(field: "blogs", aliasSuffix: alias) as! Storefront.BlogConnection
		}

		/// Find a cart by its ID. 
		open var cart: Storefront.Cart? {
			return internalGetCart()
		}

		open func aliasedCart(alias: String) -> Storefront.Cart? {
			return internalGetCart(alias: alias)
		}

		func internalGetCart(alias: String? = nil) -> Storefront.Cart? {
			return field(field: "cart", aliasSuffix: alias) as! Storefront.Cart?
		}

		/// Fetch a specific `Collection` by one of its unique attributes. 
		open var collection: Storefront.Collection? {
			return internalGetCollection()
		}

		open func aliasedCollection(alias: String) -> Storefront.Collection? {
			return internalGetCollection(alias: alias)
		}

		func internalGetCollection(alias: String? = nil) -> Storefront.Collection? {
			return field(field: "collection", aliasSuffix: alias) as! Storefront.Collection?
		}

		/// Find a collection by its handle. 
		@available(*, deprecated, message:"Use `collection` instead")
		open var collectionByHandle: Storefront.Collection? {
			return internalGetCollectionByHandle()
		}

		@available(*, deprecated, message:"Use `collection` instead")

		open func aliasedCollectionByHandle(alias: String) -> Storefront.Collection? {
			return internalGetCollectionByHandle(alias: alias)
		}

		func internalGetCollectionByHandle(alias: String? = nil) -> Storefront.Collection? {
			return field(field: "collectionByHandle", aliasSuffix: alias) as! Storefront.Collection?
		}

		/// List of the shop’s collections. 
		open var collections: Storefront.CollectionConnection {
			return internalGetCollections()
		}

		open func aliasedCollections(alias: String) -> Storefront.CollectionConnection {
			return internalGetCollections(alias: alias)
		}

		func internalGetCollections(alias: String? = nil) -> Storefront.CollectionConnection {
			return field(field: "collections", aliasSuffix: alias) as! Storefront.CollectionConnection
		}

		/// Find a customer by its access token. 
		open var customer: Storefront.Customer? {
			return internalGetCustomer()
		}

		open func aliasedCustomer(alias: String) -> Storefront.Customer? {
			return internalGetCustomer(alias: alias)
		}

		func internalGetCustomer(alias: String? = nil) -> Storefront.Customer? {
			return field(field: "customer", aliasSuffix: alias) as! Storefront.Customer?
		}

		/// Returns the localized experiences configured for the shop. 
		open var localization: Storefront.Localization {
			return internalGetLocalization()
		}

		func internalGetLocalization(alias: String? = nil) -> Storefront.Localization {
			return field(field: "localization", aliasSuffix: alias) as! Storefront.Localization
		}

		/// List of the shop's locations that support in-store pickup. When sorting by 
		/// distance, you must specify a location via the `near` argument. 
		open var locations: Storefront.LocationConnection {
			return internalGetLocations()
		}

		open func aliasedLocations(alias: String) -> Storefront.LocationConnection {
			return internalGetLocations(alias: alias)
		}

		func internalGetLocations(alias: String? = nil) -> Storefront.LocationConnection {
			return field(field: "locations", aliasSuffix: alias) as! Storefront.LocationConnection
		}

		/// A storefront menu. 
		open var menu: Storefront.Menu? {
			return internalGetMenu()
		}

		open func aliasedMenu(alias: String) -> Storefront.Menu? {
			return internalGetMenu(alias: alias)
		}

		func internalGetMenu(alias: String? = nil) -> Storefront.Menu? {
			return field(field: "menu", aliasSuffix: alias) as! Storefront.Menu?
		}

		/// Returns a specific node by ID. 
		open var node: Node? {
			return internalGetNode()
		}

		open func aliasedNode(alias: String) -> Node? {
			return internalGetNode(alias: alias)
		}

		func internalGetNode(alias: String? = nil) -> Node? {
			return field(field: "node", aliasSuffix: alias) as! Node?
		}

		/// Returns the list of nodes with the given IDs. 
		open var nodes: [Node?] {
			return internalGetNodes()
		}

		open func aliasedNodes(alias: String) -> [Node?] {
			return internalGetNodes(alias: alias)
		}

		func internalGetNodes(alias: String? = nil) -> [Node?] {
			return field(field: "nodes", aliasSuffix: alias) as! [Node?]
		}

		/// Fetch a specific `Page` by one of its unique attributes. 
		open var page: Storefront.Page? {
			return internalGetPage()
		}

		open func aliasedPage(alias: String) -> Storefront.Page? {
			return internalGetPage(alias: alias)
		}

		func internalGetPage(alias: String? = nil) -> Storefront.Page? {
			return field(field: "page", aliasSuffix: alias) as! Storefront.Page?
		}

		/// Find a page by its handle. 
		@available(*, deprecated, message:"Use `page` instead")
		open var pageByHandle: Storefront.Page? {
			return internalGetPageByHandle()
		}

		@available(*, deprecated, message:"Use `page` instead")

		open func aliasedPageByHandle(alias: String) -> Storefront.Page? {
			return internalGetPageByHandle(alias: alias)
		}

		func internalGetPageByHandle(alias: String? = nil) -> Storefront.Page? {
			return field(field: "pageByHandle", aliasSuffix: alias) as! Storefront.Page?
		}

		/// List of the shop's pages. 
		open var pages: Storefront.PageConnection {
			return internalGetPages()
		}

		open func aliasedPages(alias: String) -> Storefront.PageConnection {
			return internalGetPages(alias: alias)
		}

		func internalGetPages(alias: String? = nil) -> Storefront.PageConnection {
			return field(field: "pages", aliasSuffix: alias) as! Storefront.PageConnection
		}

		/// Fetch a specific `Product` by one of its unique attributes. 
		open var product: Storefront.Product? {
			return internalGetProduct()
		}

		open func aliasedProduct(alias: String) -> Storefront.Product? {
			return internalGetProduct(alias: alias)
		}

		func internalGetProduct(alias: String? = nil) -> Storefront.Product? {
			return field(field: "product", aliasSuffix: alias) as! Storefront.Product?
		}

		/// Find a product by its handle. 
		@available(*, deprecated, message:"Use `product` instead")
		open var productByHandle: Storefront.Product? {
			return internalGetProductByHandle()
		}

		@available(*, deprecated, message:"Use `product` instead")

		open func aliasedProductByHandle(alias: String) -> Storefront.Product? {
			return internalGetProductByHandle(alias: alias)
		}

		func internalGetProductByHandle(alias: String? = nil) -> Storefront.Product? {
			return field(field: "productByHandle", aliasSuffix: alias) as! Storefront.Product?
		}

		/// Find recommended products related to a given `product_id`. To learn more 
		/// about how recommendations are generated, see [*Showing product 
		/// recommendations on product 
		/// pages*](https://help.shopify.com/themes/development/recommended-products). 
		open var productRecommendations: [Storefront.Product]? {
			return internalGetProductRecommendations()
		}

		open func aliasedProductRecommendations(alias: String) -> [Storefront.Product]? {
			return internalGetProductRecommendations(alias: alias)
		}

		func internalGetProductRecommendations(alias: String? = nil) -> [Storefront.Product]? {
			return field(field: "productRecommendations", aliasSuffix: alias) as! [Storefront.Product]?
		}

		/// Tags added to products. Additional access scope required: 
		/// unauthenticated_read_product_tags. 
		open var productTags: Storefront.StringConnection {
			return internalGetProductTags()
		}

		open func aliasedProductTags(alias: String) -> Storefront.StringConnection {
			return internalGetProductTags(alias: alias)
		}

		func internalGetProductTags(alias: String? = nil) -> Storefront.StringConnection {
			return field(field: "productTags", aliasSuffix: alias) as! Storefront.StringConnection
		}

		/// List of product types for the shop's products that are published to your 
		/// app. 
		open var productTypes: Storefront.StringConnection {
			return internalGetProductTypes()
		}

		open func aliasedProductTypes(alias: String) -> Storefront.StringConnection {
			return internalGetProductTypes(alias: alias)
		}

		func internalGetProductTypes(alias: String? = nil) -> Storefront.StringConnection {
			return field(field: "productTypes", aliasSuffix: alias) as! Storefront.StringConnection
		}

		/// List of the shop’s products. 
		open var products: Storefront.ProductConnection {
			return internalGetProducts()
		}

		open func aliasedProducts(alias: String) -> Storefront.ProductConnection {
			return internalGetProducts(alias: alias)
		}

		func internalGetProducts(alias: String? = nil) -> Storefront.ProductConnection {
			return field(field: "products", aliasSuffix: alias) as! Storefront.ProductConnection
		}

		/// The list of public Storefront API versions, including supported, release 
		/// candidate and unstable versions. 
		open var publicApiVersions: [Storefront.ApiVersion] {
			return internalGetPublicApiVersions()
		}

		func internalGetPublicApiVersions(alias: String? = nil) -> [Storefront.ApiVersion] {
			return field(field: "publicApiVersions", aliasSuffix: alias) as! [Storefront.ApiVersion]
		}

		/// The shop associated with the storefront access token. 
		open var shop: Storefront.Shop {
			return internalGetShop()
		}

		func internalGetShop(alias: String? = nil) -> Storefront.Shop {
			return field(field: "shop", aliasSuffix: alias) as! Storefront.Shop
		}

		/// A list of redirects for a shop. 
		open var urlRedirects: Storefront.UrlRedirectConnection {
			return internalGetUrlRedirects()
		}

		open func aliasedUrlRedirects(alias: String) -> Storefront.UrlRedirectConnection {
			return internalGetUrlRedirects(alias: alias)
		}

		func internalGetUrlRedirects(alias: String? = nil) -> Storefront.UrlRedirectConnection {
			return field(field: "urlRedirects", aliasSuffix: alias) as! Storefront.UrlRedirectConnection
		}

		internal override func childResponseObjectMap() -> [GraphQL.AbstractResponse]  {
			var response: [GraphQL.AbstractResponse] = []
			objectMap.keys.forEach {
				switch($0) {
					case "articles":
					response.append(internalGetArticles())
					response.append(contentsOf: internalGetArticles().childResponseObjectMap())

					case "blog":
					if let value = internalGetBlog() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "blogByHandle":
					if let value = internalGetBlogByHandle() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "blogs":
					response.append(internalGetBlogs())
					response.append(contentsOf: internalGetBlogs().childResponseObjectMap())

					case "cart":
					if let value = internalGetCart() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "collection":
					if let value = internalGetCollection() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "collectionByHandle":
					if let value = internalGetCollectionByHandle() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "collections":
					response.append(internalGetCollections())
					response.append(contentsOf: internalGetCollections().childResponseObjectMap())

					case "customer":
					if let value = internalGetCustomer() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "localization":
					response.append(internalGetLocalization())
					response.append(contentsOf: internalGetLocalization().childResponseObjectMap())

					case "locations":
					response.append(internalGetLocations())
					response.append(contentsOf: internalGetLocations().childResponseObjectMap())

					case "menu":
					if let value = internalGetMenu() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "node":
					if let value = internalGetNode() {
						response.append((value as! GraphQL.AbstractResponse))
						response.append(contentsOf: (value as! GraphQL.AbstractResponse).childResponseObjectMap())
					}

					case "nodes":
					internalGetNodes().forEach {
						if let value = $0 {
							response.append((value as! GraphQL.AbstractResponse))
							response.append(contentsOf: (value as! GraphQL.AbstractResponse).childResponseObjectMap())
						}
					}

					case "page":
					if let value = internalGetPage() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "pageByHandle":
					if let value = internalGetPageByHandle() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "pages":
					response.append(internalGetPages())
					response.append(contentsOf: internalGetPages().childResponseObjectMap())

					case "product":
					if let value = internalGetProduct() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "productByHandle":
					if let value = internalGetProductByHandle() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "productRecommendations":
					if let value = internalGetProductRecommendations() {
						value.forEach {
							response.append($0)
							response.append(contentsOf: $0.childResponseObjectMap())
						}
					}

					case "productTags":
					response.append(internalGetProductTags())
					response.append(contentsOf: internalGetProductTags().childResponseObjectMap())

					case "productTypes":
					response.append(internalGetProductTypes())
					response.append(contentsOf: internalGetProductTypes().childResponseObjectMap())

					case "products":
					response.append(internalGetProducts())
					response.append(contentsOf: internalGetProducts().childResponseObjectMap())

					case "publicApiVersions":
					internalGetPublicApiVersions().forEach {
						response.append($0)
						response.append(contentsOf: $0.childResponseObjectMap())
					}

					case "shop":
					response.append(internalGetShop())
					response.append(contentsOf: internalGetShop().childResponseObjectMap())

					case "urlRedirects":
					response.append(internalGetUrlRedirects())
					response.append(contentsOf: internalGetUrlRedirects().childResponseObjectMap())

					default:
					break
				}
			}
			return response
		}
	}
}
